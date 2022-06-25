import { Body, Controller, Get, Post, UseGuards } from "@nestjs/common";
import { JwtAuthGuard } from "src/auth/jwt-auth.guard";
import { Provider } from "./provider.model";
import { ProviderService } from "./provider.service";

@Controller('providers')
export class ProvidersController {
    constructor(private providersService: ProviderService) {}

    
    @Get()
    async findAll(): Promise<Provider[] | Error> {
        try {
            return this.providersService.findAll();
        } catch (error) {
            return error;
        }
    }

    @Post()
    async add(@Body() provider: Provider): Promise<Provider | Error> {
        try {
            this.providersService.add(provider);
            return provider;
        } catch (error) {
            return error;
        }
    }
}