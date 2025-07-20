import { Module } from '@nestjs/common';
import { PrismaModule } from './core/database/prisma.module';
import { DocumentsModule } from './modules/document/documents.module';
import { OperationsModule } from './modules/operations/operations.module';

@Module({
  imports: [PrismaModule, DocumentsModule, OperationsModule],
})
export class AppModule {}
