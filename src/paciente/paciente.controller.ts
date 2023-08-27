import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Body,
  Param,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Paciente } from '.prisma/client';
import { CreatePacienteDto } from './paciente.dto';

@Controller('pacientes')
export class PacientesController {
  constructor(private prisma: PrismaService) {}

  @Get()
  async getAllPacientes(): Promise<Paciente[]> {
    return this.prisma.paciente.findMany();
  }

  @Get(':id')
  async getPaciente(@Param('id') id: number): Promise<Paciente> {
    const paciente = await this.prisma.paciente.findUnique({
      where: { id },
    });
    if (!paciente) {
      throw new NotFoundException('Paciente não encontrado');
    }
    return paciente;
  }

  @Post()
  async createPaciente(
    @Body() pacienteData: CreatePacienteDto,
  ): Promise<Paciente> {
    return this.prisma.paciente.create({
      data: pacienteData,
    });
  }

  @Put(':id')
  async updatePaciente(
    @Param('id') id: number,
    @Body() pacienteData: CreatePacienteDto,
  ): Promise<Paciente> {
    await this.prisma.paciente.findUnique({ where: { id } });
    return this.prisma.paciente.update({
      where: { id },
      data: pacienteData,
    });
  }

  @Delete(':id')
  async deletePaciente(@Param('id') id: number): Promise<void> {
    const paciente = await this.prisma.paciente.findUnique({ where: { id } });
    if (!paciente) {
      throw new NotFoundException('Paciente não encontrado');
    }
    await this.prisma.paciente.delete({ where: { id } });
  }
}
