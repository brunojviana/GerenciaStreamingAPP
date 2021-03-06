import { Sequelize } from "sequelize-typescript"
import { Calendar } from "src/calendar/calendar.model";
import { Content } from "src/content/content.model";
import { Provider } from "src/provider/provider.model";
import { Signature } from "src/signature/signature.model";
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
                Content,
                Provider,
                Calendar
            ]);
            await sequelize.sync();
            return sequelize;
        },
    },
]