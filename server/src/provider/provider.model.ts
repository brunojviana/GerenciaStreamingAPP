import { Blob } from "buffer";
import { BelongsTo, BelongsToMany, Column, DataType, ForeignKey, HasMany, Model, Table } from "sequelize-typescript";
import { Signature } from "src/signature/signature.model";


@Table({
    createdAt: false, 
    updatedAt: false 
})
export class Provider extends Model {
    @Column({
        type: DataType.STRING,
        allowNull: false
    })
    name: string;

    @Column({
        type: DataType.STRING,
        allowNull: false
    })
    category: string;

    @Column({
        type: DataType.STRING,
        allowNull: false
    })
    path_image: string;

    @HasMany(() => Signature)
    signature: Signature;
}