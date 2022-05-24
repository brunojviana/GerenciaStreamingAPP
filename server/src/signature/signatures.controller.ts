import { Body, Controller, Get, Post, UseGuards } from "@nestjs/common";
import { JwtAuthGuard } from "src/auth/jwt-auth.guard";
import { Signature } from "./signature.model";
import { SignatureService } from "./signature.service";


@Controller('signatures')
export class SignaturesController {
    constructor(private signaturesService: SignatureService) {}

    @UseGuards(JwtAuthGuard)
    @Get()
    async findAll(): Promise<Signature[] | Error> {
        try {
            return this.signaturesService.findAll();
        } catch (error) {
            return error;
        }
    }

    @Post()
    async add(@Body() signature: Signature): Promise<Signature | Error> {
        try {
            this.signaturesService.add(signature);
            return signature;
        } catch (error) {
            return error;
        }
    }
}