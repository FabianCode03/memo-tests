import { PrismaClient, Status } from "@prisma/client";
const prisma = new PrismaClient();

async function main() {
  await deleteAllData(); // delete all current data to start fresh
  await seedDatabase(); // seed the database with new data
  console.log("Seed completed.");
}

main()
  .catch(e => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

async function seedDatabase() {
  const backgroundColors = await seedBackgroundColors();
  await seedUsers();
  await seedSettings();
  await seedGroups();
  await seedImages();
  await seedQuotes();
  await seedVoiceRecordings();
  await seedGroupUser();
  await seedCards(backgroundColors);
}

async function deleteAllData() {
  const models = [
    "groupUser",
    "card",
    "group",
    "user",
    "backgroundColor",
    "settings",
    "image",
    "quote",
    "voiceRecording",
  ];

  for (const model of models) {
    await (prisma as any)[model].deleteMany();
  }
}

async function seedUsers() {
  const userData = [
    { name: "Alice", email: "alice@example.com" },
    { name: "Bob", email: "bob@example.com" },
    { name: "Charlie", email: "charlie@example.com" },
    { name: "David", email: "david@example.com" },
    { name: "Eve", email: "eve@example.com" },
  ];

  await prisma.user.createMany({ data: userData });
}

async function seedGroups() {
  const groupData = [
    {
      title: "Meine Reisen",
      description:
        "Träumen zwischen Palmen, und Cocktails am Strand, Paradies !!!",
    },
    {
      title: "Atelier",
      description: "Meine Bilder und künstlerischen Launen, an einem Ort...",
    },
    {
      title: "Mein Schatz und Ich ❤",
      description: "Unsere schönsten Momente, Dates und Lacher",
    },
    {
      title: "Best Friends Forever",
      description:
        "Eine Freundschaft fürs Leben und alles was danach kommen mag",
    },
    {
      title: "Game Night’s",
      description: "Jeden Donnerstag, Strategie, Siege und Niederlagen",
    },
    {
      title: "Dance Crew",
      description:
        "Eine Haufen Tanzverrückter, die Freundschaft über das schönste Hobby der Welt gefunden haben",
    },
  ];

  await prisma.group.createMany({ data: groupData });
}

async function seedImages() {
  const imageData = [
    { url: "https://example.com/image1.jpg", width: 800, height: 600 },
    { url: "https://example.com/image2.jpg", width: 1024, height: 768 },
    { url: "https://example.com/image3.jpg", width: 1280, height: 720 },
  ];

  await prisma.image.createMany({ data: imageData });
}

async function seedCards(backgroundColors: any) {
  const backgroundColorIds = backgroundColors.map((bgColor: any) => bgColor.id);

  const cardData = [
    {
      title: "Kennenlern Abend",
      description:
        "Wir haben uns alle kennengelernt, uns über unsere Vorlieben für Spiele unterhalten und ein paar Runden unserer Favoriten angespielt - Das gibts jetzt jeden Do 😎",
      startDate: new Date(2024, 2, 28),
      endDate: new Date(2024, 2, 28),
      backgroundColorId: backgroundColorIds[0],
    },
    {
      title: "Poker Abend",
      description:
        "Es war schön sich mal einen Abend lang auf nur Spiel einzustellen, stilvoll Whiskey zu trinken und so richtig das “Las Vegas” Gefühl aufkommen zu lassen.",
      startDate: new Date(2024, 3, 4),
      endDate: new Date(2024, 3, 4),
      backgroundColorId: backgroundColorIds[1],
    },
    {
      title: "Arcade Abend",
      description:
        "Unser bisher ausgelassenster Abend mit Klasikern wie Mario Kart und neuen Spielen wie Smash war einfach mega entspannt. Alles mal digital, relaxed auf dem Sofa ubd bis spät in die Nacht. ",
      startDate: new Date(2024, 11, 7),
      endDate: new Date(2024, 11, 7),
      backgroundColorId: backgroundColorIds[2],
    },
  ];

  await prisma.card.createMany({ data: cardData });
}

async function seedBackgroundColors() {
  const backgroundColorData = [
    { value: "red" },
    { value: "green" },
    { value: "blue" },
    { value: "yellow", darkText: true },
    { value: "purple" },
    { value: "orange", darkText: true },
  ];

  const createdBackgroundColors = [];

  for (const bgColor of backgroundColorData) {
    const createdColor = await prisma.backgroundColor.create({ data: bgColor });
    createdBackgroundColors.push(createdColor);
  }

  return createdBackgroundColors;
}

async function seedQuotes() {
  const quoteData = [
    {
      text: "Noch eine 6 und ich schmeiß dich vom Stuhl 😠",
      author: "Cleo nach der vierten 6 von Tim bei Kniffel 🎲",
    },
    {
      text: "Hypotheken sind wie Schimmelpilze 🍄‍ - überall und schwer loszuwerden!",
      author: "Max während Monopoly 🎩",
    },
    {
      text: "Lena geht All-In, ohne ihre Karten anzuschauen 🤣",
    },
    {
      text: "Tim verwechselt seinen Flush mit einer Straße und steigt aus 🃏, obwohl er haushoch gewonnen hätte ",
    },
    {
      text: "Cleo gewinnt in einem spektakulären Showdown mit zwei Königen gegen Lena🥇",
    },
    {
      text: "Cleo verschläft den Anfang des Rennens 🚦und wird Letzte 🏁 ",
    },
    {
      text: "Dieses Caos🌪️ ist ja noch schlimmer als dein Fahrstil 🏎",
      author: "Lena zu Tim während sie auf eine Chips Tüte am Boden tritt 🥲",
    },
    {
      text: "Alle waren sich einig das Lenas Geschmack, was Videospiele 🎮 angeht, mehr als unterirdisch ist 💩",
    },
  ];

  await prisma.quote.createMany({ data: quoteData });
}

async function seedVoiceRecordings() {
  const voiceRecordingData = [
    { url: "https://example.com/recording1.mp3", length: 120 },
    { url: "https://example.com/recording2.mp3", length: 180 },
    { url: "https://example.com/recording3.mp3", length: 240 },
  ];

  await prisma.voiceRecording.createMany({ data: voiceRecordingData });
}

async function seedGroupUser() {
  const users = await prisma.user.findMany();
  const groups = await prisma.group.findMany();

  // Stellen Sie sicher, dass genügend User und Groups vorhanden sind
  if (users.length < 5 || groups.length < 1) {
    console.error("Nicht genügend User oder Groups vorhanden");
    return;
  }

  const groupUserData = users.slice(0, 5).map(user => ({
    userId: user.id,
    groupId: groups[0].id,
    status: Status.ACTIVE_USER,
  }));

  await prisma.groupUser.createMany({ data: groupUserData });
}

async function seedSettings() {
  const user = await prisma.user.findFirst();

  if (!user || !user.id) {
    throw new Error("User not found");
  }

  const settingData = [{ userId: user.id, darkMode: true }];

  await prisma.settings.createMany({ data: settingData });
}
