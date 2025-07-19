import { Module } from '@nestjs/common';
import { DatabaseController } from './database.controller';
import { DatabaseRepository } from './database.repository';
import { DatabaseService } from './database.service';

@Module({
  controllers: [DatabaseController],
  providers: [DatabaseService, DatabaseRepository],
})
export class DatabaseModule {}
