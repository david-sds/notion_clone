import { Module } from '@nestjs/common';
import { DocumentModule } from './api/document/document.module';
import { PrismaModule } from './core/prisma/prisma.module';

@Module({
  imports: [PrismaModule, DocumentModule],
})
export class AppModule {}
