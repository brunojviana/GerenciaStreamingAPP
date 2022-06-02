import { Module } from "@nestjs/common";
import { DataBaseModule } from "../../config/database/database.module";
import { fileProviders } from "./file.providers";
import { FileService } from "./file.service";
import { FilesController } from "./files.controller";

@Module({
    imports: [DataBaseModule],
    controllers: [FilesController],
    providers: [FileService, ...fileProviders],
    exports: [FileService]
})
export class FileModule {}