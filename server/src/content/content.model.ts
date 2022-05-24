import { BelongsTo, BelongsToMany, Column, DataType, ForeignKey, HasMany, Model, Table } from "sequelize-typescript";
import { Signature } from "src/signature/signature.model";


@Table({
    createdAt: false, 
    updatedAt: false 
})
export class Content extends Model {
    @Column({
        type: DataType.STRING
    })
    name: string;
    
    @Column({
        type: DataType.STRING
    })
    category: string;
    
    @Column({
        type: DataType.DATE
    })
    start: Date;

    @Column({
        type: DataType.DATE
    })
    last_acess: Date;
    
    @Column({
        type: DataType.STRING
    })
    watch_time: string;

    @Column({
        type:DataType.INTEGER
    })
    status: number;

    @ForeignKey(() => Signature)
    @Column({
        type: DataType.INTEGER,
        allowNull: false
    })
    signature_id: number;

    @BelongsTo(() => Signature)
    signature: Signature;
}