import { Body, Controller, Delete, Get, HttpStatus, Param, Post, Put, Res, UseGuards } from "@nestjs/common";
import { Response } from "express";
import { JwtAuthGuard } from "src/auth/jwt-auth.guard";
import { SignatureService } from "src/signature/signature.service";
import { SignaturesController } from "src/signature/signatures.controller";
import { ContentInterface } from "./content.interface";
import { Content } from "./content.model";
import { ContentService } from "./content.service";


@Controller('contents')
export class ContentsController {
    constructor(private contentsService: ContentService, private signaturesService: SignatureService) {}

    //@UseGuards(JwtAuthGuard)
    @Get('/all/:id_sub')
    async findAll(@Param() param): Promise<Content[] | Error> {
        try {
            return this.contentsService.findAll(param.id_sub);
        } catch (error) {
            return error;
        }
    }

    @Post()
    async add(@Body() content: Content): Promise<Content | Error> {
        try {
            var cnt: Content = await this.contentsService.add(content);
            //this.calcViewTime(cnt.id, content.param_start, content.param_stop);
            return cnt;
        } catch (error) {
            return error;
        }
    }

    @Put()
    async update(@Body() content: Content): Promise<Content | Error> {
        try {
            const cnt: Content = await this.contentsService.update(content.id, content);
            if (cnt.status == 0)
                await this.calcViewTime(cnt.id, cnt.start, cnt.last_acess);

            return cnt;
        } catch (error) {
            return error;
        }
    }

    @Delete(':id_content')
    async delete(@Param() param, @Res() res: Response): Promise<Response<any, Record<string, any>> | Error>{
        try {
            await this.contentsService.delete(param.id_content);
            console.log(res.statusCode);
            return res.status(HttpStatus.OK).json();
        } catch (error) {
            return error;
        }
    }

    async calcViewTime(id: number, start, stop) {
        const str: Date = new Date(start);
        const stp: Date = new Date(stop);
        let diffTime: number = Math.abs(stp.getTime() - str.getTime());
        let duration: number = Math.ceil(diffTime / 3600000);
        let content: Content = await this.contentsService.findId(id);
        console.log('no CALCVIEWTIME');
        
        content.watch_time = content.watch_time + duration;
        content.save();
        this.signaturesService.calcUseTime(content.signature_id, start, stop);
    }
}