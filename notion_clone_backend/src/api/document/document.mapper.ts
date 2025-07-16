import { Document } from '@prisma/client';
import { plainToInstance } from 'class-transformer';
import { DocumentDto } from './dto/document.dto';

export class DocumentMapper {
  static entityToDto(entity: Document) {
    return plainToInstance(DocumentDto, entity);
  }
}
