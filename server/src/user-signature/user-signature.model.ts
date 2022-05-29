import { AllowNull, Column, DataType, ForeignKey, Model, Table } from "sequelize-typescript";
import { Signature } from "src/signature/signature.model";
import { User } from "src/user/user.model";


@Table({
    createdAt: false, 
    updatedAt: false 
})
export class User_Signature extends Model {
    @Column({
        primaryKey: true,
        autoIncrement: true
    })
    id: number;

    @ForeignKey(() => User)
    @Column({
        references: {
            model: 'users',
            key: 'id'
        },
        allowNull: false
    })
    user_id: number;

    @ForeignKey(() => Signature)
    @Column({
        references: {
            model: 'signatures',
            key: 'id'
        },
        allowNull: false
    })
    signature_id: number;
}