import { Module } from "@nestjs/common";
import { DataBaseModule } from "../../config/database/database.module";
import { SignatureService } from "src/signature/signature.service";
import { signatureProviders } from "./signature.providers";
import { SignaturesController } from "./signatures.controller";

@Module({
    imports: [DataBaseModule],
    controllers: [SignaturesController],
    providers: [SignatureService, ...signatureProviders],
    exports: [SignatureService]
})
export class SignatureModule {}