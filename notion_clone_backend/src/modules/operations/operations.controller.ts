import { Body, Controller, Post } from '@nestjs/common';
import { OperationDto } from './dto/operation.dto';
import { OperationsService } from './operations.service';

@Controller('operations')
export class OperationsController {
  constructor(private readonly operationsService: OperationsService) {}

  @Post()
  async applyOperations(@Body() operations: OperationDto[]) {
    return this.operationsService.applyOperations(operations);
  }
}
