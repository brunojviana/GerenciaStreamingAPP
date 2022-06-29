import { Body, Controller, Delete, Get, HttpStatus, Param, Post, Put, Res, UseGuards } from "@nestjs/common";
import { Calendar } from "./calendar.model";
import { CalendarService } from "./calendar.service";


@Controller('calendars')
export class ContentsController {
    constructor(private calendarsService: CalendarService) {}

    //@UseGuards(JwtAuthGuard)
    @Get(':id_sub')
    async findAll(@Param() param): Promise<Calendar[] | Error> {
        try {
            return this.calendarsService.findAll(param.id_sub);
        } catch (error) {
            return error;
        }
    }
}