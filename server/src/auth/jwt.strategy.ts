import { Injectable } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { ExtractJwt, Strategy } from "passport-jwt";
import { jwtConstants } from "./constants";


@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
    constructor() {
        super({
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            ignoreExpiration: false,
            secretOrKey: jwtConstants.secret
        });
    }

    async validate(payload: Payload) {
        return { 
            userId: payload.id,
            username: payload.name,
            cpf: payload.cpf,
            email: payload.email 
        }
    }
}

export class Payload {
    id: number;
    name: string;
    cpf: string;
    email: string;
}