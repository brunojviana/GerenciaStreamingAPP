import { Module } from "@nestjs/common";
import { DataBaseModule } from "../../config/database/database.module";
import { providerProviders } from "./provider.providers";
import { ProviderService } from "./provider.service";
import { ProvidersController } from "./providers.controller";

@Module({
    imports: [DataBaseModule],
    controllers: [ProvidersController],
    providers: [ProviderService, ...providerProviders],
    exports: [ProviderService]
})
export class ProviderModule {}