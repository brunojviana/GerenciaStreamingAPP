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
<<<<<<< HEAD
    reset_password: string
=======
    reset_password
>>>>>>> f01aee5a4eda0f41f28078a8c08ee6c104c300c2
    
}