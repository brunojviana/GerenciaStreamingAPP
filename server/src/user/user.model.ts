import { AllowNull, Column, DataType, Model, Table } from "sequelize-typescript";


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
    dateBirth: Date;

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
    
}