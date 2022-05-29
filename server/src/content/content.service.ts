import { Inject, Injectable } from "@nestjs/common";
import { Content } from "./content.model";
import { CONTENT_REPOSITORY } from "./constants";

@Injectable()
export class ContentService {
    constructor(
        @Inject(CONTENT_REPOSITORY)
        private contentsModel: typeof Content
    ) {}
    
    async findId(id: number): Promise<Content> {
        return this.contentsModel.findOne({
            where: {
                id: id
            }
        });
    }

    async findAll(): Promise<Content[]> {
        return this.contentsModel.findAll();
    }

    async add(content) {
        this.contentsModel.create(content);
    }

    async delete(id: number) {
        const content: Content = await this.findId(id);
        content.destroy();
    }

}