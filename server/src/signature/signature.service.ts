import { Inject, Injectable } from "@nestjs/common";
import { Signature } from "./signature.model";
import { SIGNATURE_REPOSITORY } from "./constants";
import { User } from "src/user/user.model";
import { Provider } from "src/provider/provider.model";

@Injectable()
export class SignatureService {
    constructor(
        @Inject(SIGNATURE_REPOSITORY)
        private signaturesModel: typeof Signature
    ) {}
    
    async find(id: number): Promise<Signature> {
        return this.signaturesModel.findOne({
            where: {
                id: id
            },
            include: [{
                model: Provider
            },
            {
                model: User
            }]
        });
    }

    async findAll(user_id: number): Promise<Signature[]> {
        return this.signaturesModel.findAll({
            where: {
                user_id: user_id
            },
            include: [{
                model: Provider
            },
            {
                model: User
            }]
        });
    }

    async add(signature) {
        var ret =  await this.signaturesModel.create(signature);
        var sub = this.find(ret.id);
        return sub;
    }

    async delete(id: number) {
        const signature: Signature = await this.find(id);
        signature.destroy();
    }

}