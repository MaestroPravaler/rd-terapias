// paciente.dto.ts

import { IsDateString, IsNotEmpty, IsEmail } from 'class-validator';

export class CreatePacienteDto {
  @IsNotEmpty()
  nome: string;

  @IsDateString()
  dataNascimento: string;

  @IsNotEmpty()
  localNascimento: string;

  @IsNotEmpty()
  horaNascimento: string;

  @IsNotEmpty()
  pontoAberto: string;

  @IsNotEmpty()
  telefone: string;

  @IsEmail()
  email: string;
}
