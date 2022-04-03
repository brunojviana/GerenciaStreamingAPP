import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { DataBaseModule } from 'config/database/database.module';
import { UserModule } from './user/user.module';
import { UserController } from './user/users.controller';

@Module({
  imports: [
    ConfigModule.forRoot(),
    DataBaseModule,
    UserModule
  ],
  controllers: [
    UserController
  ]
})
export class AppModule {}
