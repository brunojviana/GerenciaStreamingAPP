import { BelongsTo, Column, DataType, ForeignKey, HasMany, Model, Table } from "sequelize-typescript";
import { Signature } from "src/signature/signature.model";


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

    @Column({
        type: DataType.STRING,
        allowNull: true
    })
    path_image: string;

    @HasMany(() => Signature)
    signature: Signature;
}