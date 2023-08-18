/*
  Warnings:

  - Added the required column `birthDate` to the `Paciente` table without a default value. This is not possible if the table is not empty.
  - Added the required column `birthTime` to the `Paciente` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Paciente" DROP COLUMN "birthDate",
ADD COLUMN     "birthDate" VARCHAR(10) NOT NULL,
DROP COLUMN "birthTime",
ADD COLUMN     "birthTime" VARCHAR(5) NOT NULL;
