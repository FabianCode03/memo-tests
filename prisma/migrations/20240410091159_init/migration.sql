-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "profilePictureID" INTEGER,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Group" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "isSolo" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "thumbnailID" INTEGER,

    CONSTRAINT "Group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Card" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Card_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Image" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "width" INTEGER NOT NULL,
    "height" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "scaledDownId" INTEGER,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Quote" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "author" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Quote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VoiceRecording" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VoiceRecording_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BackgroundColor" (
    "id" SERIAL NOT NULL,
    "value" TEXT NOT NULL,
    "darkText" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BackgroundColor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GroupUser" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "groupId" TEXT NOT NULL,
    "isAdmin" BOOLEAN NOT NULL DEFAULT false,
    "isFavorite" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GroupUser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GroupCard" (
    "id" TEXT NOT NULL,
    "groupId" TEXT NOT NULL,
    "cardId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GroupCard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardImage" (
    "id" TEXT NOT NULL,
    "cardId" TEXT NOT NULL,
    "imageId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CardImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardQuote" (
    "id" TEXT NOT NULL,
    "cardId" TEXT NOT NULL,
    "quoteId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CardQuote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardVoiceRecording" (
    "id" TEXT NOT NULL,
    "cardId" TEXT NOT NULL,
    "voiceRecordingId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CardVoiceRecording_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardBackgroundColor" (
    "id" TEXT NOT NULL,
    "cardId" TEXT NOT NULL,
    "backgroundColorId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CardBackgroundColor_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Group_id_key" ON "Group"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Card_id_key" ON "Card"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Image_id_key" ON "Image"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Image_url_key" ON "Image"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Image_scaledDownId_key" ON "Image"("scaledDownId");

-- CreateIndex
CREATE UNIQUE INDEX "Quote_id_key" ON "Quote"("id");

-- CreateIndex
CREATE UNIQUE INDEX "VoiceRecording_id_key" ON "VoiceRecording"("id");

-- CreateIndex
CREATE UNIQUE INDEX "VoiceRecording_url_key" ON "VoiceRecording"("url");

-- CreateIndex
CREATE UNIQUE INDEX "BackgroundColor_id_key" ON "BackgroundColor"("id");

-- CreateIndex
CREATE UNIQUE INDEX "BackgroundColor_value_key" ON "BackgroundColor"("value");

-- CreateIndex
CREATE UNIQUE INDEX "GroupUser_id_key" ON "GroupUser"("id");

-- CreateIndex
CREATE UNIQUE INDEX "GroupUser_userId_groupId_key" ON "GroupUser"("userId", "groupId");

-- CreateIndex
CREATE UNIQUE INDEX "GroupCard_id_key" ON "GroupCard"("id");

-- CreateIndex
CREATE UNIQUE INDEX "GroupCard_groupId_cardId_key" ON "GroupCard"("groupId", "cardId");

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
CREATE UNIQUE INDEX "CardBackgroundColor_id_key" ON "CardBackgroundColor"("id");

-- CreateIndex
CREATE UNIQUE INDEX "CardBackgroundColor_cardId_backgroundColorId_key" ON "CardBackgroundColor"("cardId", "backgroundColorId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_profilePictureID_fkey" FOREIGN KEY ("profilePictureID") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_thumbnailID_fkey" FOREIGN KEY ("thumbnailID") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_scaledDownId_fkey" FOREIGN KEY ("scaledDownId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

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
ALTER TABLE "CardImage" ADD CONSTRAINT "CardImage_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

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

-- AddForeignKey
ALTER TABLE "CardBackgroundColor" ADD CONSTRAINT "CardBackgroundColor_backgroundColorId_fkey" FOREIGN KEY ("backgroundColorId") REFERENCES "BackgroundColor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
