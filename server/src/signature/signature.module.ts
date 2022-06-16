import { Module } from "@nestjs/common";
import { DataBaseModule } from "../../config/database/database.module";
import { SignatureService } from "src/signature/signature.service";
import { signatureProviders } from "./signature.providers";
import { SignaturesController } from "./signatures.controller";
import { CalendarService } from "src/calendar/calendar.service";
import { CalendarModule } from "src/calendar/calendar.module";
import { calendarProviders } from "src/calendar/calendar.providers";

@Module({
    imports: [DataBaseModule, CalendarModule],
    controllers: [SignaturesController],
    providers: [SignatureService, ...signatureProviders],
    exports: [SignatureService]
})
export class SignatureModule {}