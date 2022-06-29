import { Body, Controller, Delete, Get, HttpStatus, Param, Post, Put, Res, UseGuards } from "@nestjs/common";
import { Response } from "express";
import { JwtAuthGuard } from "src/auth/jwt-auth.guard";
import { Calendar } from "src/calendar/calendar.model";
import { CalendarService } from "src/calendar/calendar.service";
import { Signature } from "./signature.model";
import { SignatureService } from "./signature.service";


@Controller('signatures')
export class SignaturesController {
    constructor(
        private signaturesService: SignatureService,
        private calendarsService: CalendarService
    ) {}

    //@UseGuards(JwtAuthGuard)
    @Get('/all/:id_user')
    async findAll(@Param() param): Promise<Signature[] | Error> {
        try {
            return this.signaturesService.findAll(param.id_user);
        } catch (error) {
            return error;
        }
    }

    //@UseGuards(JwtAuthGuard)
    @Get(':id')
    async findId(@Param() param): Promise<Signature | Error> {
        try {
            return this.signaturesService.find(param.id);
        } catch (error) {
            return error;
        }
    }

    @Post()
    async add(@Body() signature: Signature): Promise<any | Error> {
        try {
            var ret: Signature = await this.signaturesService.add(signature);
            return ret;
        } catch (error) {
            return error;
        }
    }

    @Put()
    async update(@Body() signature: Signature): Promise<Signature | Error> {
        try {
            return this.signaturesService.update(signature.id, signature);
        } catch (error) {
            return error;
        }
    }

    @Delete(':id_sub')
    async delete(@Param() param, @Res() res: Response): Promise<Response<any, Record<string, any>> | Error>{
        try {
            await this.signaturesService.delete(param.id_sub);
            console.log(res.statusCode);
            return res.status(HttpStatus.OK).json();
        } catch (error) {
            return error;
        }
    }
    
    async registerSpending(subscription: Signature) {
        let spending: number;
        let deactivationDate: Date;
        let year: number;
        let month: number;

        if (subscription.period_payment == 'monthly')
            spending = subscription.price;
        else
            spending = subscription.price / 12;
        
        if (subscription.status == 1)
            deactivationDate = new Date();
    
        month = subscription.date_signature.getMonth() + 1;
        year = subscription.date_signature.getFullYear();
    
        while (year <= deactivationDate.getFullYear()) {
            await this.calendarsService.add({month: month, year: year, spending: spending, signature_id: subscription.id});
            
            if (month == 12) {
                year = year + 1;
                month = 1;
            }
            else {
                month = month + 1;
            }

            if ((month > (deactivationDate.getMonth() + 1)) && (year == deactivationDate.getFullYear()))
                break
        }
    }

    max(a,b) {
        return (a > b) ? a : b;
    }

    subscriptionSet(maxSpending, listSubscriptions: Signature[]) {
        let i: number, w: number;
        let numberOfSubscriptions: number = listSubscriptions.length;
        let subscriptionSet: any[];
        let K = new Array(numberOfSubscriptions + 1);
        
        for (i=0; i < K.length; i++) {
            K[i] = new Array(maxSpending + 1);
            for (let j=0; j < (maxSpending + 1); j++)
            {
                K[i][j]=0;
            }
        }

        for (i = 0; i <= numberOfSubscriptions; i++) {
            for (w = 0; w <= maxSpending; w++) {
                if (i == 0 || w == 0)
                    K[i][w] = 0;
                else if (listSubscriptions[i - 1].price <= w)
                    K[i][w] = Math.max(listSubscriptions[i - 1].time +
                        K[i - 1][w - listSubscriptions[i - 1].price],
                        K[i - 1][w]);
                else
                    K[i][w] = K[i - 1][w];
            }
        }
   
        let res = K[numberOfSubscriptions][maxSpending];
   
        w = maxSpending;
        for (i = numberOfSubscriptions; (i > 0) && (res > 0); i--)
        {
            if (res == K[i - 1][w])
                continue;
            else {
                subscriptionSet.push(listSubscriptions[i-1])
                res = res - listSubscriptions[i-1].time;
                w = w - listSubscriptions[i-1].price;
            }
        }

        return subscriptionSet;
    }
    
}