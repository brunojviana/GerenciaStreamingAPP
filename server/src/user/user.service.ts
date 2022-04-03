import { Inject, Injectable } from "@nestjs/common";
import { User } from "./user.model";
import { USER_REPOSITORY } from "./constants";

@Injectable()
export class UserService {
    constructor(
        @Inject(USER_REPOSITORY)
        private usersModel: typeof User
    ) {}

    async findAll(): Promise<User[]> {
        return this.usersModel.findAll();
    }

    async add(user) {
        this.usersModel.create(user);
    }

}