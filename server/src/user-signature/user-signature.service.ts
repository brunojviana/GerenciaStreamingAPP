import { Inject, Injectable } from "@nestjs/common";
import { Op } from "sequelize";
import { User_Signature } from './user-signature.model';
import { USER_SIGNATURE_REPOSITORY } from "./constants";


@Injectable()
export class UserSignatureService {
    
    constructor(
        @Inject(USER_SIGNATURE_REPOSITORY)
        private users_signaturesModel: typeof User_Signature
    ) {}

    async add(user_id: number, signature_id: number) {
        const user_signature: any = { user_id: user_id, signature_id: signature_id}
        this.users_signaturesModel.create(user_signature);
    }

    async findAll(): Promise<User_Signature[]> {
        return this.users_signaturesModel.findAll();
    }

    async findId(user_id: number, signature_id?: number): Promise<User_Signature> {
        return this.users_signaturesModel.findOne({
            where: {
                [Op.and]: [{ user_id: user_id }, { signature_id: signature_id }]
            }
        });
    }

    async delete(user_id: number, signature_id?: number) {
        try {
            const usuario_habilidade: User_Signature = await this.findId(user_id, signature_id);
            usuario_habilidade.destroy();
        } catch (error) {
            const usuario_habilidade: User_Signature = await this.findId(user_id, signature_id);
            usuario_habilidade.destroy();
        }
    }
}