import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { MailerModule } from '@nestjs-modules/mailer';
import { DataBaseModule } from 'config/database/database.module';
import { mailConfig } from 'config/mail/mail.config';
import { AuthModule } from './auth/auth.module';
import { ContentModule } from './content/content.module';
import { SignatureModule } from './signature/signature.module';
import { UserSignatureModule } from './user-signature/user-signature.module';
import { UserModule } from './user/user.module';

@Module({
  imports: [
    ConfigModule.forRoot(),
    DataBaseModule,
    UserModule,
    SignatureModule,
    UserSignatureModule,
    ContentModule,
    AuthModule,
    MailerModule.forRoot(mailConfig)
  ]
})
export class AppModule {}
