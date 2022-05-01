import { Inject, Injectable } from "@nestjs/common";
import { User } from "./user.model";
import { USER_REPOSITORY } from "./constants";

@Injectable()
export class UserService {
    constructor(
        @Inject(USER_REPOSITORY)
        private usersModel: typeof User
    ) {}
    
    async find(cpf: string): Promise<User> {
        return this.usersModel.findOne({
            where: {
                cpf: cpf
            }
        });
    }

    async findEmail(email: string): Promise<User> {
        return this.usersModel.findOne({
            where: {
                email: email
            }
        });
    }

    async findAll(): Promise<User[]> {
        return this.usersModel.findAll();
    }

    async add(user) {
        this.usersModel.create(user);
    }

}