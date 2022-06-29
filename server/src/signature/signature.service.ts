import { Inject, Injectable } from "@nestjs/common";
import { Signature } from "./signature.model";
import { SIGNATURE_REPOSITORY } from "./constants";
import { User } from "src/user/user.model";
import { Provider } from "src/provider/provider.model";
import { CalendarService } from "src/calendar/calendar.service";
import { Calendar } from "src/calendar/calendar.model";

@Injectable()
export class SignatureService {
    constructor(
        @Inject(SIGNATURE_REPOSITORY)
        private signaturesModel: typeof Signature,
        private calendarsService: CalendarService
    ) {}
    
    async find(id: number): Promise<Signature> {
        return this.signaturesModel.findOne({
            where: {
                id: id
            },
            include: [{
                model: Provider,
            },
            {
                model: User
            }]
        });
    }

    async findAll(user_id: number): Promise<Signature[]> {
        return this.signaturesModel.findAll({
            where: {
                user_id: user_id
            },
            order: [
                ['id', 'DESC']
            ],
            include: [{
                model: Provider
            },
            {
                model: User
            }]
        });
    }

    async add(signature) {
        var ret =  await this.signaturesModel.create(signature);
        var sub = this.find(ret.id);
        return sub;
    }

    async update(id: number, signature: Signature) {
        return this.signaturesModel.update(signature, {
            where: {
                id: id
            },
            returning: true
        }).then(() => {
            return this.find(id);
        });
    }

    async delete(id: number) {
        const signature: Signature = await this.find(id);
        await signature.destroy();
    }

    async calcUseTime(id, start, stop) {
        const str: Date = new Date(start);
        const stp: Date = new Date(stop);
        let diffTime: number = Math.abs(stp.getTime() - str.getTime());
        let useTime: number = Math.ceil(diffTime / 3600000);
        let subscription: Signature = await this.find(id);
        let listUseTime: Calendar[] = await this.calendarsService.findSubscription(subscription.id);
        let year: any;
        let month: any;
        
        subscription.time = subscription.time + useTime;
        subscription.save();
        
        month = new Date(stop).getMonth() + 1;
        year = new Date(stop).getFullYear();
        
        if (listUseTime.length > 0) {
            listUseTime.map(async period => {
                if (period.month == month && period.year == year) {
                    period.use_time = period.use_time + useTime;
                    console.log(period.use_time);
                    period.save();
                    console.log('atualizadp');
                }
            });
        }
    }

}