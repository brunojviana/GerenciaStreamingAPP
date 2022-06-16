import { Calendar } from "./calendar.model";
import { CALENDAR_REPOSITORY } from "./constants";


export const calendarProviders = [
    {
        provide: CALENDAR_REPOSITORY,
        useValue: Calendar
    },
];