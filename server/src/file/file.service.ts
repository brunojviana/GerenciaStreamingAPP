import { Inject, Injectable } from "@nestjs/common";
import { FILE_REPOSITORY } from "./constants";
import { File } from "./file.model";

@Injectable()
export class FileService {
    constructor(
        @Inject(FILE_REPOSITORY)
        private filesModel: typeof File
    ) {}
    
    async find(id: number): Promise<File> {
        return this.filesModel.findOne({
            where: {
                id: id
            }
        });
    }

    async findAll(): Promise<File[]> {
        return this.filesModel.findAll();
    }

    async add(file) {
        this.filesModel.create(file);
    }

    async delete(id: number) {
        const file: File = await this.find(id);
        file.destroy();
    }

}