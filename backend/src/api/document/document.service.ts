import { Injectable, NotFoundException } from '@nestjs/common';
import {
  handlePrismaError,
  isPrismaKnownError,
} from 'src/common/utils/prisma-error-handler.util';
import { DocumentRepository } from './document.repository';
import { DocumentDto } from './dto/document.dto';

@Injectable()
export class DocumentService {
  constructor(private readonly documentRepository: DocumentRepository) {}

  create(payload: DocumentDto): Promise<DocumentDto> {
    return this.documentRepository.create(payload);
  }

  findAll(): Promise<DocumentDto[]> {
    return this.documentRepository.findAll();
  }

  async findOne(id: number): Promise<DocumentDto> {
    const res = await this.documentRepository.findOne(id);

    if (!res) {
      throw new NotFoundException('Document not found.');
    }

    return res;
  }

  async update(
    id: number,
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

  async remove(id: number): Promise<DocumentDto> {
    try {
      return await this.documentRepository.remove(id);
    } catch (e) {
      if (isPrismaKnownError(e)) {
        handlePrismaError(e);
      }
      throw e;
    }
  }
}
