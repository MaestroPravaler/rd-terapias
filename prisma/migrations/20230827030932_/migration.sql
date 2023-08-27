/*
  Warnings:

  - You are about to drop the column `alergias` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `cep` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `cidade` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `cirurgias` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `comorbidades` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `cpf` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `doencas` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `endereco` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `estado` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `medicamentos` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `observacoes` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `pais` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `profissao` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `vacinas` on the `Paciente` table. All the data in the column will be lost.
  - The `dataNascimento` column on the `Paciente` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- DropIndex
DROP INDEX "Paciente_cpf_key";

-- DropIndex
DROP INDEX "Paciente_email_key";

-- AlterTable
ALTER TABLE "Paciente" DROP COLUMN "alergias",
DROP COLUMN "cep",
DROP COLUMN "cidade",
DROP COLUMN "cirurgias",
DROP COLUMN "comorbidades",
DROP COLUMN "cpf",
DROP COLUMN "doencas",
DROP COLUMN "endereco",
DROP COLUMN "estado",
DROP COLUMN "medicamentos",
DROP COLUMN "observacoes",
DROP COLUMN "pais",
DROP COLUMN "profissao",
DROP COLUMN "status",
DROP COLUMN "vacinas",
ADD COLUMN     "horaNascimento" TEXT,
ADD COLUMN     "localNascimento" TEXT,
ADD COLUMN     "pontoAberto" TEXT,
DROP COLUMN "dataNascimento",
ADD COLUMN     "dataNascimento" TIMESTAMP(3),
ALTER COLUMN "telefone" DROP NOT NULL;

-- CreateTable
CREATE TABLE "Consulta" (
    "id" SERIAL NOT NULL,
    "data" TIMESTAMP(3) NOT NULL,
    "hora" TEXT NOT NULL,
    "pacienteId" INTEGER NOT NULL,
    "observacoes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Consulta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Anamnese" (
    "id" SERIAL NOT NULL,
    "pacienteId" INTEGER NOT NULL,
    "queixaPrincipal" TEXT NOT NULL,
    "historiaDoencaAtual" TEXT NOT NULL,
    "historiaPatologicaPregressa" TEXT NOT NULL,
    "historiaFamiliar" TEXT NOT NULL,
    "habitosDeVida" TEXT NOT NULL,
    "medicamentosEmUso" TEXT NOT NULL,
    "outros" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Anamnese_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_pacienteId_fkey" FOREIGN KEY ("pacienteId") REFERENCES "Paciente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Anamnese" ADD CONSTRAINT "Anamnese_pacienteId_fkey" FOREIGN KEY ("pacienteId") REFERENCES "Paciente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
