import { Module } from "@nestjs/common";
import { DataBaseModule } from "../../config/database/database.module";
import { calendarProviders } from "./calendar.providers";
import { CalendarService } from "./calendar.service";

@Module({
    imports: [DataBaseModule],
    providers: [CalendarService, ...calendarProviders],
    exports: [CalendarService]
})
export class CalendarModule {}