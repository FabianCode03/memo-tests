/*
  Warnings:

  - The primary key for the `Card` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Card` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `CardBackgroundColor` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `CardBackgroundColor` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `CardImage` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `CardImage` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `CardQuote` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `CardQuote` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `CardVoiceRecording` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `CardVoiceRecording` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Group` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Group` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `GroupCard` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `GroupCard` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `GroupUser` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `GroupUser` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Quote` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Quote` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `VoiceRecording` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `VoiceRecording` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `cardId` on the `CardBackgroundColor` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `cardId` on the `CardImage` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `cardId` on the `CardQuote` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `quoteId` on the `CardQuote` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `cardId` on the `CardVoiceRecording` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `voiceRecordingId` on the `CardVoiceRecording` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `groupId` on the `GroupCard` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `cardId` on the `GroupCard` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `GroupUser` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `groupId` on the `GroupUser` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "CardBackgroundColor" DROP CONSTRAINT "CardBackgroundColor_cardId_fkey";

-- DropForeignKey
ALTER TABLE "CardImage" DROP CONSTRAINT "CardImage_cardId_fkey";

-- DropForeignKey
ALTER TABLE "CardQuote" DROP CONSTRAINT "CardQuote_cardId_fkey";

-- DropForeignKey
ALTER TABLE "CardQuote" DROP CONSTRAINT "CardQuote_quoteId_fkey";

-- DropForeignKey
ALTER TABLE "CardVoiceRecording" DROP CONSTRAINT "CardVoiceRecording_cardId_fkey";

-- DropForeignKey
ALTER TABLE "CardVoiceRecording" DROP CONSTRAINT "CardVoiceRecording_voiceRecordingId_fkey";

-- DropForeignKey
ALTER TABLE "GroupCard" DROP CONSTRAINT "GroupCard_cardId_fkey";

-- DropForeignKey
ALTER TABLE "GroupCard" DROP CONSTRAINT "GroupCard_groupId_fkey";

-- DropForeignKey
ALTER TABLE "GroupUser" DROP CONSTRAINT "GroupUser_groupId_fkey";

-- DropForeignKey
ALTER TABLE "GroupUser" DROP CONSTRAINT "GroupUser_userId_fkey";

-- AlterTable
ALTER TABLE "Card" DROP CONSTRAINT "Card_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Card_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "CardBackgroundColor" DROP CONSTRAINT "CardBackgroundColor_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "cardId",
ADD COLUMN     "cardId" INTEGER NOT NULL,
ADD CONSTRAINT "CardBackgroundColor_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "CardImage" DROP CONSTRAINT "CardImage_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "cardId",
ADD COLUMN     "cardId" INTEGER NOT NULL,
ADD CONSTRAINT "CardImage_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "CardQuote" DROP CONSTRAINT "CardQuote_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "cardId",
ADD COLUMN     "cardId" INTEGER NOT NULL,
DROP COLUMN "quoteId",
ADD COLUMN     "quoteId" INTEGER NOT NULL,
ADD CONSTRAINT "CardQuote_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "CardVoiceRecording" DROP CONSTRAINT "CardVoiceRecording_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "cardId",
ADD COLUMN     "cardId" INTEGER NOT NULL,
DROP COLUMN "voiceRecordingId",
ADD COLUMN     "voiceRecordingId" INTEGER NOT NULL,
ADD CONSTRAINT "CardVoiceRecording_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Group" DROP CONSTRAINT "Group_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Group_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "GroupCard" DROP CONSTRAINT "GroupCard_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "groupId",
ADD COLUMN     "groupId" INTEGER NOT NULL,
DROP COLUMN "cardId",
ADD COLUMN     "cardId" INTEGER NOT NULL,
ADD CONSTRAINT "GroupCard_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "GroupUser" DROP CONSTRAINT "GroupUser_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "groupId",
ADD COLUMN     "groupId" INTEGER NOT NULL,
ADD CONSTRAINT "GroupUser_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Quote" DROP CONSTRAINT "Quote_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Quote_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "VoiceRecording" DROP CONSTRAINT "VoiceRecording_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "VoiceRecording_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "Card_id_key" ON "Card"("id");

-- CreateIndex
CREATE UNIQUE INDEX "CardBackgroundColor_id_key" ON "CardBackgroundColor"("id");

-- CreateIndex
CREATE UNIQUE INDEX "CardBackgroundColor_cardId_backgroundColorId_key" ON "CardBackgroundColor"("cardId", "backgroundColorId");

-- CreateIndex
CREATE UNIQUE INDEX "CardImage_id_key" ON "CardImage"("id");

-- CreateIndex
CREATE UNIQUE INDEX "CardImage_cardId_imageId_key" ON "CardImage"("cardId", "imageId");

-- CreateIndex
CREATE UNIQUE INDEX "CardQuote_id_key" ON "CardQuote"("id");

-- CreateIndex
CREATE UNIQUE INDEX "CardQuote_cardId_quoteId_key" ON "CardQuote"("cardId", "quoteId");

-- CreateIndex
CREATE UNIQUE INDEX "CardVoiceRecording_id_key" ON "CardVoiceRecording"("id");

-- CreateIndex
CREATE UNIQUE INDEX "CardVoiceRecording_cardId_voiceRecordingId_key" ON "CardVoiceRecording"("cardId", "voiceRecordingId");

-- CreateIndex
CREATE UNIQUE INDEX "Group_id_key" ON "Group"("id");

-- CreateIndex
CREATE UNIQUE INDEX "GroupCard_id_key" ON "GroupCard"("id");

-- CreateIndex
CREATE UNIQUE INDEX "GroupCard_groupId_cardId_key" ON "GroupCard"("groupId", "cardId");

-- CreateIndex
CREATE UNIQUE INDEX "GroupUser_id_key" ON "GroupUser"("id");

-- CreateIndex
CREATE UNIQUE INDEX "GroupUser_userId_groupId_key" ON "GroupUser"("userId", "groupId");

-- CreateIndex
CREATE UNIQUE INDEX "Quote_id_key" ON "Quote"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "VoiceRecording_id_key" ON "VoiceRecording"("id");

-- AddForeignKey
ALTER TABLE "GroupUser" ADD CONSTRAINT "GroupUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupUser" ADD CONSTRAINT "GroupUser_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupCard" ADD CONSTRAINT "GroupCard_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupCard" ADD CONSTRAINT "GroupCard_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Card"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardImage" ADD CONSTRAINT "CardImage_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Card"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardQuote" ADD CONSTRAINT "CardQuote_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Card"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardQuote" ADD CONSTRAINT "CardQuote_quoteId_fkey" FOREIGN KEY ("quoteId") REFERENCES "Quote"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardVoiceRecording" ADD CONSTRAINT "CardVoiceRecording_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Card"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardVoiceRecording" ADD CONSTRAINT "CardVoiceRecording_voiceRecordingId_fkey" FOREIGN KEY ("voiceRecordingId") REFERENCES "VoiceRecording"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardBackgroundColor" ADD CONSTRAINT "CardBackgroundColor_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Card"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
