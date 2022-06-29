import { Inject, Injectable } from "@nestjs/common";
import { Content } from "./content.model";
import { CONTENT_REPOSITORY } from "./constants";
import { Signature } from "src/signature/signature.model";
import { Provider } from "src/provider/provider.model";
import { User } from "src/user/user.model";

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
            },
            include: [{
                model: Signature,
                include: [{ 
                    model: Provider,
                }, 
                {
                    model: User,
                }]
            }]
        });
    }

    async findAll(signature_id: number): Promise<Content[]> {
        return this.contentsModel.findAll({
            where: {
                signature_id: signature_id
            },
            order: [
                ['id', 'DESC']
            ],
            include: [{
                model: Signature,
                include: [{ 
                    model: Provider,
                }, 
                {
                    model: User,
                }]
            }]
        });
    }

    async add(content) {
        var ret = await this.contentsModel.create(content);
        var cnt = this.findId(ret.id);
        return cnt;
    }

    async update(id: number, content: Content) {
        console.log(content);
        return this.contentsModel.update(content, {
            where: {
                id: id
            },
            returning: true
        }).then(() => {
            return this.findId(id);
        });
    }

    async delete(id: number) {
        const content: Content = await this.findId(id);
        content.destroy();
    }

}