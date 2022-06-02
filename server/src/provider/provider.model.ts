import { Blob } from "buffer";
import { BelongsTo, BelongsToMany, Column, DataType, ForeignKey, HasMany, Model, Table } from "sequelize-typescript";
import { Content } from "src/content/content.model";
import { File } from "src/file/file.model";
import { Signature } from "src/signature/signature.model";
import { User_Signature } from "src/user-signature/user-signature.model";
import { User } from "src/user/user.model";


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

    @ForeignKey(() => File)
    @Column({
        type: DataType.INTEGER,
        allowNull: false
    })
    file_id: number;

    @BelongsTo(() => File)
    file: File;

    @HasMany(() => Signature)
    signature: Signature;
}