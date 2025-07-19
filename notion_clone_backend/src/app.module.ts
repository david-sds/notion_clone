import { Module } from '@nestjs/common';
import { PrismaModule } from './core/database/prisma.module';
import { DocumentModule } from './modules/document/document.module';
import { DatabaseModule } from './modules/database/database.module';

@Module({
  imports: [PrismaModule, DocumentModule, DatabaseModule],
})
export class AppModule {}
