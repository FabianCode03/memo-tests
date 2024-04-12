import { PrismaClient } from "@prisma/client";
import { log } from "console";
const prisma = new PrismaClient();

// code passed to main() will be directly executed on the database
async function main() {
  await returnAllDatabaseTables();
}

async function returnAllDatabaseTables() {
  const models = [
    "user",
    "group",
    "image",
    "quote",
    "voiceRecording",
    "groupUser",
    "card",
    "settings",
    "backgroundColor",
  ];

  for (const model of models) {
    const records = await (prisma as any)[model].findMany();
    console.log(records);
  }
}

main()
  .catch(e => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
