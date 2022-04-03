import { AllowNull, Column, DataType, Model, Table } from "sequelize-typescript";


@Table({
    freezeTableName: true,
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
        type: DataType.STRING,
        allowNull: false
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
    
}