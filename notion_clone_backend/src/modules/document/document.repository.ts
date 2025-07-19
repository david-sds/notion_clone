import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/core/database/prisma.service';
import { DocumentMapper } from './document.mapper';
import { DocumentDto } from './dto/document.dto';

@Injectable()
export class DocumentRepository {
  constructor(private readonly prismaService: PrismaService) {}

  async create(payload: DocumentDto): Promise<DocumentDto> {
    const res = await this.prismaService.document.create({
      data: {
        id: payload.id,
        title: payload.title,
        databaseId: payload.database.id,
        createdAt: payload.createdAt,
        updatedAt: payload.updatedAt,
      },
    });

    return DocumentMapper.entityToDto(res);
  }

  async findAll(): Promise<DocumentDto[]> {
    const res = await this.prismaService.document.findMany();

    return res.map((e) => DocumentMapper.entityToDto(e));
  }

  async findOne(id: string): Promise<DocumentDto | undefined> {
    const res = await this.prismaService.document.findUnique({
      where: { id: id },
    });

    return DocumentMapper.entityToDto(res);
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

    return DocumentMapper.entityToDto(res);
  }

  async remove(id: string): Promise<DocumentDto> {
    const res = await this.prismaService.document.delete({ where: { id: id } });

    return DocumentMapper.entityToDto(res);
  }
}
