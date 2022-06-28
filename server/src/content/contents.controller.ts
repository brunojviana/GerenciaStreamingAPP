import { Body, Controller, Delete, Get, HttpStatus, Param, Post, Res, UseGuards } from "@nestjs/common";
import { Response } from "express";
import { JwtAuthGuard } from "src/auth/jwt-auth.guard";
import { SignaturesController } from "src/signature/signatures.controller";
import { ContentInterface } from "./content.interface";
import { Content } from "./content.model";
import { ContentService } from "./content.service";


@Controller('contents')
export class ContentsController {
    constructor(private contentsService: ContentService) {}

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
    async add(@Body() content: ContentInterface): Promise<Content | Error> {
        try {
            let contentAdd = { 
                name: content.name, 
                category: content.category, 
                start: content.start,
                last_acess: content.last_acess,
                watch_time: content.watch_time,
                status: content.status,
                signature_id: content.signature_id
            };
            let cnt: Content = await this.contentsService.add(contentAdd);
            console.log(cnt);
            //this.calcViewTime(cnt.id, content.param_start, content.param_stop);
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
        let sig: SignaturesController;
        
        content.watch_time = content.watch_time + duration;
        content.last_acess = stop;
        content.save();
        sig.calcUseTime(content.signature_id, start, stop);
    }
}