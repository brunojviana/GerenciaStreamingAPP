import { Injectable, UnauthorizedException } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { Strategy } from "passport-local";
import { AuthService } from "./auth.service";


@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
    constructor(private authService: AuthService) {
        super({ usernameField: "cpf" });
    }

    async validate(username: string, password: string) {
        const user = await this.authService.validateUser(username, password);

        if (!user) {
            throw new UnauthorizedException("Usuário não autenticado.");
        }
    
        return user;
    }
}