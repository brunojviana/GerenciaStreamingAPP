import { Body, Controller, Get, Post } from "@nestjs/common";
import { User } from "./user.model";
import { UserService } from "./user.service";


@Controller('users')
export class UserController {
    constructor(private usersService: UserService) {}

    @Get()
    async findAll(): Promise<User[] | Error> {
        try {
            return this.usersService.findAll();
        } catch (error) {
            return error;
        }
    }

    @Post()
    async add(@Body() user: User): Promise<User | Error> {
        try {
            this.usersService.add(user);
            return user;
        } catch (error) {
            return error;
        }
    }
}