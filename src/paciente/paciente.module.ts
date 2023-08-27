import { Module } from '@nestjs/common';
import { PrismaModule } from '../prisma/prisma.module';
import { PacientesController } from './paciente.controller';

@Module({
  imports: [PrismaModule],
  controllers: [PacientesController],
})
export class PacienteModule {}
