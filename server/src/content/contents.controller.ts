import { Body, Controller, Get, Post, UseGuards } from "@nestjs/common";
import { JwtAuthGuard } from "src/auth/jwt-auth.guard";
import { Content } from "./content.model";
import { ContentService } from "./content.service";


@Controller('contents')
export class ContentsController {
    constructor(private contentsService: ContentService) {}

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
    async add(@Body() content: Content): Promise<Content | Error> {
        try {
            this.contentsService.add(content);
            return content;
        } catch (error) {
            return error;
        }
    }
}