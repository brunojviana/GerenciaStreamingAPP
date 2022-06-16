import { BelongsTo, Column, DataType, ForeignKey, HasMany, Model, Table } from "sequelize-typescript";
import { Calendar } from "src/calendar/calendar.model";
import { Content } from "src/content/content.model";
import { Provider } from "src/provider/provider.model";
import { User } from "src/user/user.model";


@Table({
    createdAt: false, 
    updatedAt: false 
})
export class Signature extends Model {
    @Column({
        type: DataType.DATE
    })
    date_signature: Date;
    
    @Column({
        type: DataType.INTEGER
    })
    screens: number;
    
    @Column({
        type: DataType.STRING
    })
    max_resolution: string;

    @Column({
        type: DataType.FLOAT
    })
    price: number;
    
    @Column({
        type: DataType.STRING
    })
    period_payment: string;

    @Column({
        type:DataType.INTEGER
    })
    num_content: number;

    @Column({
        type:DataType.BIGINT
    })
    time: number;

    @Column({
        type:DataType.INTEGER
    })
    status: number;

    @ForeignKey(() => Provider)
    @Column({
        type: DataType.INTEGER,
        allowNull: false
    })
    provider_id: number;

    @ForeignKey(() => User)
    @Column({
        type: DataType.INTEGER,
        allowNull: false
    })
    user_id: number;

    @BelongsTo(() => User)
    user: User;

    @HasMany(() => Content)
    content: Content;

    @HasMany(() => Calendar)
    calendar: Calendar;

    @BelongsTo(() => Provider)
    provider: Provider;
}