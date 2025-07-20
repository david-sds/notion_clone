import { Module } from '@nestjs/common';
import { DocumentsModule } from '../document/documents.module';
import { OperationsController } from './operations.controller';
import { OperationsRepository } from './operations.repository';
import { OperationsService } from './operations.service';

@Module({
  controllers: [OperationsController],
  providers: [OperationsService, OperationsRepository],
  imports: [DocumentsModule],
})
export class OperationsModule {}
