import { Injectable } from '@nestjs/common';
import { EntityType } from 'src/core/enums/operation_type.enum';

import { DocumentsService } from '../document/documents.service';
import { OperationDto } from './dto/operation.dto';
import { OperationsRepository } from './operations.repository';

@Injectable()
export class OperationsService {
  constructor(
    private readonly operationsRepository: OperationsRepository,
    private readonly documentsService: DocumentsService,
  ) {}

  async applyOperations(operations: OperationDto[]): Promise<void> {
    for (const operation of operations) {
      this.operationsRepository.createOperation(operation);

      switch (operation.entity) {
        case EntityType.Document:
          this.documentsService.applyOperation(operation);
          break;
        // case EntityType.Database:
        //   this.databasesService.applyOperation(operation);
        //   break;
        default:
          break;
      }
    }
  }
}
