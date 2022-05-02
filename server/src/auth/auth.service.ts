import { MailerService } from "@nestjs-modules/mailer";
import { Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import { randomBytes } from "crypto";
import { UserModule } from "src/user/user.module";
import { UserService } from "src/user/user.service";


@Injectable()
export class AuthService {
    constructor(
        private userService: UserService,
        private jwtService: JwtService,
        private mailService: MailerService
    ) {}

    async validateUser(email: string, password: string) {
        const user = await this.userService.findEmail(email);

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

    async sendRecoverPasswordEmail(emailUser: string) {
        const user = await this.userService.findEmail(emailUser);
    
        if (!user){
            return null;
        }
    
        user.reset_password = randomBytes(4).toString('hex');
        
        user.save();

        const mail = {
            to: user.email,
            from: 'noreply@application.com',
            subject: 'Recuperação de senha',
            text: 'Código para recuperar a senha',
            html: `<p>Este é o código para recuperar a senha: <b>${user.reset_password}</b></p>`,
        };
        try {
            let info = await this.mailService.sendMail(mail);
            console.log(info);
        } catch (error) {
            console.log(error);
        }
        
        return emailUser;
    }
}

export class User {
    id: number;
    name: string;
    cpf: string;
    email: string;
}