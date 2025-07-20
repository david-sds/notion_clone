import { NotFoundException } from '@nestjs/common';
import { Prisma } from '@prisma/client';

export function handlePrismaError(e: Prisma.PrismaClientKnownRequestError) {
  switch (e.code) {
    case 'P2025':
      throw new NotFoundException(`${e.meta.modelName} not found`);
    default:
      throw e;
  }
}

export function isPrismaKnownError(
  error: unknown,
): error is Prisma.PrismaClientKnownRequestError {
  return (
    typeof error === 'object' &&
    error !== null &&
    'code' in error &&
    error.constructor?.name === 'PrismaClientKnownRequestError'
  );
}
