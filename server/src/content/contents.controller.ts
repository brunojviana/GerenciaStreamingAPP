import { Body, Controller, Get, Post, UseGuards } from "@nestjs/common";
import { JwtAuthGuard } from "src/auth/jwt-auth.guard";
import { SignaturesController } from "src/signature/signatures.controller";
import { ContentInterface } from "./content.interface";
import { Content } from "./content.model";
import { ContentService } from "./content.service";


@Controller('contents')
export class ContentsController {
    constructor(private contentsService: ContentService, private signaturesController: SignaturesController) {}

    @UseGuards(JwtAuthGuard)
    @Get()
    async findAll(): Promise<Content[] | Error> {
        try {
            return this.contentsService.findAll();
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
            let cnt = await this.contentsService.add(contentAdd);
            this.calcViewTime(cnt.id, content.param_start, content.param_stop);
            return cnt;
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
        
        content.watch_time = content.watch_time + duration;
        content.last_acess = stop;
        content.save();
        this.signaturesController.calcUseTime(content.signature_id, start, stop);
    }
}