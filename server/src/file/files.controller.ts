import { Body, Controller, Get, Post, UploadedFile, UseGuards, UseInterceptors } from "@nestjs/common";
import { FileInterceptor } from "@nestjs/platform-express";
import { JwtAuthGuard } from "src/auth/jwt-auth.guard";
import { File } from "./file.model";
import { FileService } from "./file.service";

@Controller('files')
export class FilesController {
    constructor(private filesService: FileService) {}

    @UseGuards(JwtAuthGuard)
    @Get()
    async findAll(): Promise<File[] | Error> {
        try {
            return this.filesService.findAll();
        } catch (error) {
            return error;
        }
    }

    @Post('/upload')
    @UseInterceptors(FileInterceptor('file'))
    add(@UploadedFile() file: Express.Multer.File): Promise<File | Error> {
        try {
            //this.filesService.add(file);
            console.log(file);
        } catch (error) {
            return error;
        }
    }
}