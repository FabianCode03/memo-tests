import { PrismaClient } from "@prisma/client";
import { log } from "console";
const prisma = new PrismaClient();

async function main() {
  // delete all data
  //   await prisma.user.deleteMany({});
  //   await prisma.group.deleteMany({});
  //   await prisma.card.deleteMany({});
  //   await prisma.image.deleteMany({});
  //   await prisma.quote.deleteMany({});
  //   await prisma.voiceRecording.deleteMany({});
  //   await prisma.backgroundColor.deleteMany({});
  //   await prisma.groupUser.deleteMany({});
  //   await prisma.groupCard.deleteMany({});
  //   await prisma.cardImage.deleteMany({});
  //   await prisma.cardQuote.deleteMany({});
  //   await prisma.cardVoiceRecording.deleteMany({});
  //   await prisma.cardBackgroundColor.deleteMany({});
}

main()
  .catch(e => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
