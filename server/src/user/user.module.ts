import { Module } from "@nestjs/common";
import { DataBaseModule } from "../../config/database/database.module";
import { UserService } from "src/user/user.service";
import { userProviders } from "./user.providers";

@Module({
    imports: [DataBaseModule],
    providers: [UserService, ...userProviders],
    exports: [UserService]
})
export class UserModule {}