import { Module } from "@nestjs/common";
import { DataBaseModule } from "../../config/database/database.module";
import { UserService } from "src/user/user.service";
import { userProviders } from "./user.providers";
import { UserController } from "./users.controller";

@Module({
    imports: [DataBaseModule],
    controllers: [UserController],
    providers: [UserService, ...userProviders],
    exports: [UserService]
})
export class UserModule {}