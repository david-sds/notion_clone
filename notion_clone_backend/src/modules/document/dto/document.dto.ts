import { Type } from 'class-transformer';
import { IsDate, IsOptional, IsString, IsUUID } from 'class-validator';
import { DatabaseDto } from 'src/modules/database/dto/database.dto';

export class DocumentDto {
  @IsUUID()
  id: string;

  @IsString()
  title: string;

  @Type(() => DatabaseDto)
  database: DatabaseDto;

  @IsDate()
  createdAt: Date;

  @IsDate()
  updatedAt: Date;

  @IsDate()
  @IsOptional()
  deletedAt?: Date;
}
