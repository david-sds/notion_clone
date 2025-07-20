import { IsDate, IsEnum, IsJSON, IsString, IsUUID } from 'class-validator';
import { OperationType } from 'src/core/enums/entity_type.enum';
import { EntityType } from 'src/core/enums/operation_type.enum';

export class OperationDto {
  @IsString()
  id: string;

  @IsEnum(EntityType)
  entity: EntityType;

  @IsEnum(OperationType)
  type: OperationType;

  @IsJSON()
  payload: any;

  @IsDate()
  timestamp: Date;

  @IsUUID()
  userId: string;
}
