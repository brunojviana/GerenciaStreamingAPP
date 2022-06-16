import { Inject, Injectable } from "@nestjs/common";
import { Calendar } from "./calendar.model";
import { CALENDAR_REPOSITORY } from "./constants";

@Injectable()
export class CalendarService {
    constructor(
        @Inject(CALENDAR_REPOSITORY)
        private calendarsModel: typeof Calendar
    ) {}
    
    async findId(id: number): Promise<Calendar> {
        return this.calendarsModel.findOne({
            where: {
                id: id
            }
        });
    }

    async findAll(): Promise<Calendar[]> {
        return this.calendarsModel.findAll({
            where: {

            }
        });
    }

    async findSubscription(signature_id: number): Promise<Calendar[]> {
        return this.calendarsModel.findAll({
            where: {
                signature_id: signature_id
            }
        })
    }

    async add(calendar) {
        this.calendarsModel.create(calendar);
    }

    async update(calendar: Calendar, id: number): Promise<Calendar> {
        return this.calendarsModel.update(calendar, {
            where: {
                id: id
            },
            returning: true
        }).then(() => {
            return this.findId(id);
        });
    }

    async delete(id: number) {
        const calendar: Calendar = await this.findId(id);
        calendar.destroy();
    }

}
