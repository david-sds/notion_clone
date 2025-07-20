import { IsDate, IsOptional, IsString, IsUUID } from 'class-validator';

export class DocumentDto {
  @IsUUID()
  id: string;

  @IsString()
  title: string;

  // @Type(() => DatabaseDto)
  // database: DatabaseDto;

  @IsDate()
  createdAt: Date;

  @IsDate()
  updatedAt: Date;

  @IsDate()
  @IsOptional()
  deletedAt?: Date;
}
