import { Sequelize } from "sequelize-typescript"
import { Content } from "src/content/content.model";
import { Signature } from "src/signature/signature.model";
import { User_Signature } from "src/user-signature/user-signature.model";
import { User } from "src/user/user.model";


export const databaseProviders = [
    {
        provide: 'SEQUELIZE',
        useFactory: async () => {
            const sequelize = new Sequelize({
                dialect: 'mysql',
                host: process.env.HOST,
                port: parseInt(process.env.PORT),
                username: process.env.USER,
                password: process.env.PASSWORD,
                database: process.env.DATABASE
            });
            sequelize.addModels([
                User,
                Signature,
                User_Signature,
                Content
            ]);
            await sequelize.sync();
            return sequelize;
        },
    },
]