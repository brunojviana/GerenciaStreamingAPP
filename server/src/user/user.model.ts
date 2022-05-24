import { BelongsToMany, Column, DataType, HasMany, Model, Table } from "sequelize-typescript";
import { Content } from "src/content/content.model";
import { Signature } from "src/signature/signature.model";
import { User_Signature } from "src/user-signature/user-signature.model";


@Table({
    createdAt: false, 
    updatedAt: false 
})
export class User extends Model {
    @Column({
        type: DataType.STRING,
        allowNull: false
    })
    name: string;

    @Column({
        type: DataType.STRING(11),
        allowNull: false,
        unique: true
    })
    cpf: string;

    @Column({
        type: DataType.STRING,
        allowNull: false,
        unique: true
    })
    email: string;

    @Column({
        type: DataType.DATEONLY,
        allowNull: false
    })
    date_birth: Date;

    @Column({
        type: DataType.STRING(8),
        allowNull: false
    })
    password: string;

    @Column({
        type:DataType.STRING,
        allowNull: true
    })
    reset_password: string;

    @BelongsToMany(() => Signature, () => User_Signature)
    signatures: Signature[];
}