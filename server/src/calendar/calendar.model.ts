import { BelongsTo, Column, DataType, ForeignKey, Model, Table } from "sequelize-typescript";
import { Signature } from "src/signature/signature.model";

@Table({
    createdAt: false, 
    updatedAt: false 
})
export class Calendar extends Model {
    @Column({
        type: DataType.INTEGER
    })
    month: number;
    
    @Column({
        type: DataType.INTEGER
    })
    year: number;
    
    @Column({
        type: DataType.BIGINT
    })
    use_time: number;

    @Column({
        type: DataType.DOUBLE
    })
    spending: number;

    @ForeignKey(() => Signature)
    @Column({
        type: DataType.INTEGER,
        allowNull: false
    })
    signature_id: number;

    @BelongsTo(() => Signature)
    signature: Signature;
}