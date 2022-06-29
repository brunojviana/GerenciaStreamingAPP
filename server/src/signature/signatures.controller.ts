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
    async findId(@Param() param) {
        try {
            return this.signaturesService.find(param.id);
        } catch (error) {
            return error;
        }
    }

    @Post()
    async add(@Body() signature: Signature): Promise<any | Error> {
        try {
            console.log(signature);
            var ret: Signature = await this.signaturesService.add(signature);
            await this.registerSpending(ret);
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
    
    @Get('/recommendations/:id_user/:maxSpending')
    async subscriptionSet(@Param() params) {
        console.log(params.id_user)
        let i: number, w: number;
        let subs = await this.signaturesService.findAll(parseInt(params.id_user));
        let numberOfSubscriptions: number = subs.length;
        let subscriptionSet: any[];
        let K = new Array(numberOfSubscriptions + 1);
        console.log(params.maxSpending);
        for (i=0; i < K.length; i++) {
            K[i] = new Array(parseFloat(params.maxSpending) + 1);
            for (let j=0; j < (parseFloat(params.maxSpending) + 1); j++)
            {
                K[i][j]=0;
            }
        }

        for (i = 0; i <= numberOfSubscriptions; i++) {
            for (w = 0; w <= parseFloat(params.maxSpending); w++) {
                if (i == 0 || w == 0)
                    K[i][w] = 0;
                else if (subs[i - 1].price <= w)
                    K[i][w] = Math.max(subs[i - 1].time +
                        K[i - 1][w - subs[i - 1].price],
                        K[i - 1][w]);
                else
                    K[i][w] = K[i - 1][w];
            }
        }
   
        let res = K[numberOfSubscriptions][parseFloat(params.maxSpending)];
        console.log(res);
   
        w = parseFloat(params.maxSpending);
        for (i = numberOfSubscriptions; (i > 0) && (res > 0); i--)
        {
            if (res == K[i - 1][w])
                continue;
            else {
                subscriptionSet.push(subs[i-1])
                res = res - subs[i-1].time;
                w = w - subs[i-1].price;
            }
        }

        console.log(subscriptionSet);

        return subscriptionSet;
    }

    async registerSpending(subscription: Signature) {
        let spending: number;
        let deactivationDate: Date;
        let year: number;
        let month: number;

        if (subscription.period_payment == 'Monthly')
            spending = subscription.price;
        else
            spending = subscription.price / 12;
        
        if (subscription.status == 1)
            deactivationDate = new Date();
        
            const data: Date = new Date(subscription.date_signature);
            
            month = data.getMonth() + 1;
            year = data.getFullYear();
            
            while (year <= deactivationDate.getFullYear()) {
                await this.calendarsService.add({month: month, year: year, useTime: subscription.time, spending: spending, signature_id: subscription.id});
                
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

    
    
}