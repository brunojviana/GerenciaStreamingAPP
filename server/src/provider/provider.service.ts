import { Inject, Injectable } from "@nestjs/common";
import { PROVIDER_REPOSITORY } from "./constants";
import { Provider } from "./provider.model";

@Injectable()
export class ProviderService {
    constructor(
        @Inject(PROVIDER_REPOSITORY)
        private providersModel: typeof Provider
    ) {}
    
    async find(id: number): Promise<Provider> {
        return this.providersModel.findOne({
            where: {
                id: id
            }
        });
    }

    async findAll(): Promise<Provider[]> {
        return this.providersModel.findAll();
    }

    async add(provider) {
        this.providersModel.create(provider);
    }

    async delete(id: number) {
        const provider: Provider = await this.find(id);
        provider.destroy();
    }

}