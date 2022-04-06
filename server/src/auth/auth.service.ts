import { Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import { UserService } from "src/user/user.service";


@Injectable()
export class AuthService {
    constructor(
        private userService: UserService,
        private jwtService: JwtService
    ) {}

    async validateUser(cpf: string, password: string) {
        const user = await this.userService.find(cpf);

        if (user && user.password === password) {
            const { id, name, cpf, email } = user;

            return { id: id, name, cpf, email };
        }

        return null;
    }

    async login(user: User) {
        const payload = {
            id: user.id,
            username: user.name,
            cpf: user.cpf,
            email: user.email
        };

        return { access_token: this.jwtService.sign(payload) };
    }
}

export class User {
    id: number;
    name: string;
    cpf: string;
    email: string;
}