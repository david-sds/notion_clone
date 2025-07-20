import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import {
  handlePrismaError,
  isPrismaKnownError,
} from 'src/common/utils/prisma-error-handler.util';
import { OperationType } from 'src/core/enums/entity_type.enum';
import { OperationDto } from '../operations/dto/operation.dto';
import { DocumentsRepository } from './documents.repository';
import { DocumentDto } from './dto/document.dto';

@Injectable()
export class DocumentsService {
  constructor(private readonly documentRepository: DocumentsRepository) {}

  create(payload: DocumentDto): Promise<DocumentDto> {
    return this.documentRepository.create(payload);
  }

  findAll(): Promise<DocumentDto[]> {
    return this.documentRepository.findAll();
  }

  async findOne(id: string): Promise<DocumentDto> {
    const res = await this.documentRepository.findOne(id);

    if (!res) {
      throw new NotFoundException('Documents not found.');
    }

    return res;
  }

  async update(
    id: string,
    payload: Partial<DocumentDto>,
  ): Promise<DocumentDto> {
    try {
      return await this.documentRepository.update(id, payload);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }

  async applyOperation(operation: OperationDto) {
    switch (operation.type) {
      case OperationType.Create:
        await this.documentRepository.create(operation.payload);
        break;
      case OperationType.Update:
        await this.documentRepository.update(
          operation.payload.id,
          operation.payload,
        );
        break;
      case OperationType.Delete:
        if (!operation.payload.deletedAt) {
          throw new BadRequestException('Document missing deletedAt.');
        }

        await this.documentRepository.update(
          operation.payload.id,
          operation.payload,
        );
        break;
      default:
        break;
    }
  }
}
