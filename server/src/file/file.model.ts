import { Blob } from "buffer";
import { Column, DataType, HasOne, Model, Table } from "sequelize-typescript";
import { Provider } from "src/provider/provider.model";
import { User } from "src/user/user.model";


@Table({
    createdAt: false, 
    updatedAt: false 
})
export class File extends Model {
    @Column({
        type: DataType.STRING,
        allowNull: false
    })
    type: string;

    @Column({
        type: DataType.INTEGER,
        allowNull: false
    })
    size: number;

    @Column({
        type: DataType.BLOB,
        allowNull: false
    })
    file: Blob;

    @HasOne(() => User)
    user: User;

    @HasOne(() => Provider)
    provider: Provider
}