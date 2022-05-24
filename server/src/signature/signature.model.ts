import { BelongsToMany, Column, DataType, ForeignKey, HasMany, Model, Table } from "sequelize-typescript";
import { Content } from "src/content/content.model";
import { User_Signature } from "src/user-signature/user-signature.model";
import { User } from "src/user/user.model";


@Table({
    createdAt: false, 
    updatedAt: false 
})
export class Signature extends Model {
    @Column({
        type: DataType.STRING
    })
    name_provider: string;

    @Column({
        type: DataType.STRING
    })
    category_provider: string;

    @Column({
        type: DataType.DATEONLY
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
    contents: number;

    @Column({
        type:DataType.STRING
    })
    time: string;

    @Column({
        type:DataType.INTEGER
    })
    status: number;

    @BelongsToMany(() => User, () => User_Signature)
    users: User[];

    @HasMany(() => Content)
    content: Content
}