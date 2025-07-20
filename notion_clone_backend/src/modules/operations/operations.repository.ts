import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/core/database/prisma.service';
import { OperationDto } from './dto/operation.dto';
import { OperationsMapper } from './operations.mapper';

@Injectable()
export class OperationsRepository {
  constructor(private readonly prismaService: PrismaService) {}

  async createOperation(operation: OperationDto): Promise<OperationDto> {
    const entity = await this.prismaService.operation.create({
      data: {
        id: operation.id,
        entity: operation.entity,
        type: operation.type,
        payload: operation.payload,
        timestamp: operation.timestamp,
        // userId: operation.userId,
      },
    });

    return OperationsMapper.entityToDto(entity);
  }
}
