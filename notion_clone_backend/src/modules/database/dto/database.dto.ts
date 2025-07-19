import { IsDate, IsOptional, IsString, IsUUID } from 'class-validator';

export class DatabaseDto {
  @IsUUID()
  id: string;

  @IsString()
  title: string;

  @IsDate()
  createdAt: Date;

  @IsDate()
  updatedAt: Date;

  @IsDate()
  @IsOptional()
  deletedAt?: Date;
}
