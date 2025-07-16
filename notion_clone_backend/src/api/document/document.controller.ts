import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseIntPipe,
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
  findOne(@Param('id', ParseIntPipe) id: number): Promise<DocumentDto> {
    return this.documentService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() payload: Partial<DocumentDto>,
  ): Promise<DocumentDto> {
    return this.documentService.update(id, payload);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number): Promise<DocumentDto> {
    return this.documentService.remove(id);
  }
}
