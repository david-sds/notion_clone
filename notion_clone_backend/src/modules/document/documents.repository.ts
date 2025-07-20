import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/core/database/prisma.service';
import { DocumentsMapper } from './documents.mapper';
import { DocumentDto } from './dto/document.dto';

@Injectable()
export class DocumentsRepository {
  constructor(private readonly prismaService: PrismaService) {}

  async create(payload: DocumentDto): Promise<DocumentDto> {
    const res = await this.prismaService.document.create({
      data: {
        id: payload.id,
        title: payload.title,
        // databaseId: payload.database.id,
        createdAt: payload.createdAt,
        updatedAt: payload.updatedAt,
      },
    });

    return DocumentsMapper.entityToDto(res);
  }

  async findAll(): Promise<DocumentDto[]> {
    const res = await this.prismaService.document.findMany();

    return res.map((e) => DocumentsMapper.entityToDto(e));
  }

  async findOne(id: string): Promise<DocumentDto | undefined> {
    const res = await this.prismaService.document.findUnique({
      where: { id: id },
    });

    return DocumentsMapper.entityToDto(res);
  }

  async update(
    id: string,
    payload: Partial<DocumentDto>,
  ): Promise<DocumentDto> {
    const res = await this.prismaService.document.update({
      where: { id: id },
      data: {
        title: payload.title,
      },
    });

    return DocumentsMapper.entityToDto(res);
  }
}
