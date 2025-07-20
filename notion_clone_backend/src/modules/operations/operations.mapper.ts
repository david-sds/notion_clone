import { plainToInstance } from 'class-transformer';
import { OperationDto } from './dto/operation.dto';

export class OperationsMapper {
  static entityToDto = (entity: any): OperationDto => {
    return plainToInstance(OperationDto, entity);
  };
}
