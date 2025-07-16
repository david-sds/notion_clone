import {
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
  Min,
} from 'class-validator';

export class DocumentDto {
  @IsOptional()
  @IsNumber()
  @Min(1)
  id?: number;

  @IsNotEmpty()
  @IsString()
  title: string;
}
