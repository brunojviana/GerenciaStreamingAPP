import { Module } from "@nestjs/common";
import { DataBaseModule } from "../../config/database/database.module";
import { UserSignatureService } from "./user-signature.service";
import { user_signatureProviders } from "./user-signature.providers";

@Module({
    imports: [DataBaseModule],
    providers: [UserSignatureService, ...user_signatureProviders],
    exports: [UserSignatureService]
})
export class UserSignatureModule {}