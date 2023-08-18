/*
  Warnings:

  - The primary key for the `Paciente` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `birthDate` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `birthTime` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Paciente` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Paciente` table. All the data in the column will be lost.
  - The `id` column on the `Paciente` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[cpf]` on the table `Paciente` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `dataNascimento` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `telefone` to the `Paciente` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Paciente" DROP CONSTRAINT "Paciente_pkey",
DROP COLUMN "birthDate",
DROP COLUMN "birthTime",
DROP COLUMN "name",
DROP COLUMN "phone",
ADD COLUMN     "alergias" TEXT,
ADD COLUMN     "cep" TEXT,
ADD COLUMN     "cidade" TEXT,
ADD COLUMN     "cirurgias" TEXT,
ADD COLUMN     "comorbidades" TEXT,
ADD COLUMN     "cpf" TEXT,
ADD COLUMN     "dataNascimento" TEXT NOT NULL,
ADD COLUMN     "doencas" TEXT,
ADD COLUMN     "endereco" TEXT,
ADD COLUMN     "estado" TEXT,
ADD COLUMN     "medicamentos" TEXT,
ADD COLUMN     "nome" TEXT NOT NULL,
ADD COLUMN     "observacoes" TEXT,
ADD COLUMN     "pais" TEXT,
ADD COLUMN     "profissao" TEXT,
ADD COLUMN     "status" TEXT,
ADD COLUMN     "telefone" TEXT NOT NULL,
ADD COLUMN     "vacinas" TEXT,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "email" DROP NOT NULL,
ADD CONSTRAINT "Paciente_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "Paciente_cpf_key" ON "Paciente"("cpf");
