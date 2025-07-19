import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { DocumentService } from './document.service';
import { DocumentDto } from './dto/document.dto';

@Controller('documents')
export class DocumentController {
  constructor(private readonly documentService: DocumentService) {}

  @Post()
  create(@Body() payload: DocumentDto): Promise<DocumentDto> {
    return this.documentService.create(payload);
  }

  @Get()
  findAll(): Promise<DocumentDto[]> {
    return this.documentService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<DocumentDto> {
    return this.documentService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() payload: Partial<DocumentDto>,
  ): Promise<DocumentDto> {
    return this.documentService.update(id, payload);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<DocumentDto> {
    return this.documentService.remove(id);
  }
}
