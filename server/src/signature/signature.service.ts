import { Inject, Injectable } from "@nestjs/common";
import { Signature } from "./signature.model";
import { SIGNATURE_REPOSITORY } from "./constants";

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
            }
        });
    }

    async findAll(): Promise<Signature[]> {
        return this.signaturesModel.findAll();
    }

    async add(signature) {
        this.signaturesModel.create(signature);
    }

}