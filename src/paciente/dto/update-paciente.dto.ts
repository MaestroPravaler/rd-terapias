import { PartialType } from '@nestjs/mapped-types';
import { CreatePacienteDto } from './create-paciente.dto';

export class UpdatePacienteDto extends PartialType(CreatePacienteDto) {
  readonly nome: string;
  readonly cpf: string;
  readonly dataNascimento: string;
  readonly telefone: string;
  readonly email: string;
  readonly endereco: string;
  readonly cidade: string;
  readonly estado: string;
  readonly pais: string;
  readonly cep: string;
  readonly profissao: string;
  readonly comorbidades: string;
  readonly medicamentos: string;
  readonly alergias: string;
  readonly vacinas: string;
  readonly doencas: string;
  readonly cirurgias: string;
  readonly observacoes: string;
  readonly status: string;
  readonly createdAt: Date;
  readonly updatedAt: Date;
}
