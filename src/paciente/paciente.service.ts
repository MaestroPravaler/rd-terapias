import { Injectable } from '@nestjs/common';
import { CreatePacienteDto } from './dto/create-paciente.dto';
import { UpdatePacienteDto } from './dto/update-paciente.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class PacienteService {
  constructor(private prismaService: PrismaService) {}

  create(createPacienteDto: CreatePacienteDto) {
    return this.prismaService.paciente.create({
      data: createPacienteDto,
    });
  }

  findAll() {
    return this.prismaService.paciente.findMany();
  }

  findOne(id: number) {
    return this.prismaService.paciente.findUnique({
      where: { id },
    });
  }

  update(id: number, updatePacienteDto: UpdatePacienteDto) {
    return this.prismaService.paciente.update({
      where: { id },
      data: updatePacienteDto,
    });
  }

  remove(id: number) {
    return this.prismaService.paciente.delete({
      where: { id },
    });
  }
}
