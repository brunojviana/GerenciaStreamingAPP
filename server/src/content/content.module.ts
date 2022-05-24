import { Module } from "@nestjs/common";
import { DataBaseModule } from "../../config/database/database.module";
import { ContentService } from "./content.service";
import { contentProviders } from "./content.providers";
import { ContentsController } from "./contents.controller";

@Module({
    imports: [DataBaseModule],
    controllers: [ContentsController],
    providers: [ContentService, ...contentProviders],
    exports: [ContentService]
})
export class ContentModule {}