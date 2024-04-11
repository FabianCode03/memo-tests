// import { db } from "../src/utils/db.server";

// // type definitions for the seed data
// type User = {
//   firstName: string;
//   lastName: string;
// };

// type Group = {
//   title: string;
//   description: string | null;
//   isSolo: boolean;
// };

// type Card = {
//   title: string;
//   description: string | null;
// };

// type Image = {
//   url: string;
//   width: number;
//   height: number;
// };

// type Quote = {
//   text: string;
//   author: string | null;
// };

// type VoiceRecording = {
//   url: string;
//   duration: number;
// };

// type BackgroundColor = {
//   value: string;
//   darkText: boolean;
// };

// type GroupUser = {
//   groupId: number;
//   userId: number;
//   isAdmin: boolean;
//   isFavorite: boolean;
// };

// type GroupCard = {
//   groupId: number;
//   cardId: number;
// };

// type CardImage = {
//   cardId: string;
//   imageId: number;
// };

// type CardQuote = {
//   cardId: string;
//   quoteId: string;
// };

// type CardVoiceRecording = {
//   cardId: string;
//   voiceRecordingId: string;
// };

// type CardBackgroundColors = {
//   cardId: string;
//   backgroundColorId: number;
// };

// // seed data
// function getSeedData() {
//   const users: User[] = [
//     { firstName: "Alice", lastName: "Smith" },
//     { firstName: "Bob", lastName: "Jones" },
//     { firstName: "Charlie", lastName: "Brown" },
//   ];

//   const groups: Group[] = [
//     {
//       title: "Freundesgruppe",
//       description: "Tanzen fürs leben!",
//       isSolo: false,
//     },
//     { title: "Familiengruppe", description: "Familie!!!", isSolo: false },
//     { title: "Solo Group", description: "Solo group", isSolo: true },
//   ];

//   const cards: Card[] = [
//     {
//       title: "Quantenphysik",
//       description:
//         "Die faszinierende Welt der Quanten und ihrer unvorhersehbaren Natur.",
//     },
//     {
//       title: "Maschinelles Lernen",
//       description:
//         "Wie Maschinen lernen, menschenähnliche Aufgaben zu erledigen.",
//     },
//     {
//       title: "Raumfahrt",
//       description:
//         "Die unendlichen Weiten des Universums und unsere Bemühungen, es zu erkunden.",
//     },
//     {
//       title: "Nachhaltigkeit",
//       description:
//         "Wie wir unseren Planeten für zukünftige Generationen bewahren können.",
//     },
//     {
//       title: "Künstliche Intelligenz",
//       description:
//         "Die Auswirkungen von KI auf unsere Gesellschaft und Wirtschaft.",
//     },
//     {
//       title: "Gesundheitstechnologie",
//       description:
//         "Die neuesten Fortschritte in der Medizintechnik und Gesundheitsversorgung.",
//     },
//     {
//       title: "Cybersicherheit",
//       description:
//         "Die Bedeutung der Sicherheit unserer Daten in der digitalen Welt.",
//     },
//     {
//       title: "Blockchain-Technologie",
//       description:
//         "Die Technologie hinter Kryptowährungen und ihre potenziellen Anwendungen.",
//     },
//     {
//       title: "Virtuelle Realität",
//       description:
//         "Die aufregenden Möglichkeiten der virtuellen Realität in verschiedenen Branchen.",
//     },
//     {
//       title: "Selbstfahrende Autos",
//       description:
//         "Die Technologie hinter autonomen Fahrzeugen und ihre Auswirkungen auf die Gesellschaft.",
//     },
//   ];

//   const images: Image[] = [
//     { url: "https://example.com/image1.jpg", width: 800, height: 600 },
//     { url: "https://example.com/image2.jpg", width: 1920, height: 1080 },
//     { url: "https://example.com/image3.jpg", width: 3840, height: 2160 },
//   ];

//   const quotes: Quote[] = [
//     {
//       text: "Zwei Dinge sind unendlich, das Universum und die menschliche Dummheit, aber bei dem Universum bin ich mir noch nicht ganz sicher.",
//       author: "Albert Einstein",
//     },
//     {
//       text: "Es ist nicht genug zu wissen, man muss auch anwenden. Es ist nicht genug zu wollen, man muss auch tun.",
//       author: "Johann Wolfgang von Goethe",
//     },
//     {
//       text: "Der einzige Weg, großartige Arbeit zu leisten, ist zu lieben, was man tut.",
//       author: "Steve Jobs",
//     },
//   ];

//   const voiceRecordings: VoiceRecording[] = [
//     { url: "https://example.com/recording1.mp3", duration: 60 },
//     { url: "https://example.com/recording2.mp3", duration: 13 },
//     { url: "https://example.com/recording3.mp3", duration: 89 },
//   ];

//   const backgroundColors: BackgroundColor[] = [
//     { value: "#FFFFFF", darkText: true },
//     { value: "#000000", darkText: false },
//     { value: "#FF0000", darkText: true },
//   ];

//   const groupUsers: GroupUser[] = [
//     { groupId: 1, userId: 1, isAdmin: true, isFavorite: true },
//     { groupId: 1, userId: 2, isAdmin: false, isFavorite: false },
//     { groupId: 2, userId: 2, isAdmin: true, isFavorite: true },
//     { groupId: 2, userId: 3, isAdmin: false, isFavorite: false },
//     { groupId: 3, userId: 3, isAdmin: true, isFavorite: true },
//   ];

//   const groupCards: GroupCard[] = [
//     { groupId: 1, cardId: 1 },
//     { groupId: 1, cardId: 2 },
//     { groupId: 2, cardId: 2 },
//     { groupId: 2, cardId: 3 },
//     { groupId: 3, cardId: 3 },
//   ];

//   const cardImages: CardImage[] = [
//     { cardId: 1, imageId: 1 },
//     { cardId: 2, imageId: 2 },
//     { cardId: 3, imageId: 3 },
//   ];

//   const cardQuotes: CardQuote[] = [
//     { cardId: 1, quoteId: 1 },
//     { cardId: 2, quoteId: 2 },
//     { cardId: 3, quoteId: 3 },
//   ];

//   const cardVoiceRecordings: CardVoiceRecording[] = [
//     { cardId: 1, voiceRecordingId: 1 },
//     { cardId: 2, voiceRecordingId: 2 },
//     { cardId: 3, voiceRecordingId: 3 },
//   ];

//   const cardBackgroundColors: CardBackgroundColors[] = [
//     { cardId: 1, backgroundColorId: 1 },
//     { cardId: 2, backgroundColorId: 2 },
//     { cardId: 3, backgroundColorId: 3 },
//   ];

//   return {
//     users,
//     groups,
//     cards,
//     images,
//     quotes,
//     voiceRecordings,
//     backgroundColors,
//     groupUsers,
//     groupCards,
//     cardImages,
//     cardQuotes,
//     cardVoiceRecordings,
//     cardBackgroundColors,
//   };
// }

// // seed the database
// async function seed() {
//   const data = getSeedData();

//   // insert seed data into the database
//   await db.user.createMany({ data: data.users });
//   await db.group.createMany({ data: data.groups });
//   await db.card.createMany({ data: data.cards });
//   await db.image.createMany({ data: data.images });
//   await db.quote.createMany({ data: data.quotes });
//   await db.voiceRecording.createMany({ data: data.voiceRecordings });
//   await db.backgroundColor.createMany({ data: data.backgroundColors });
//   await db.groupUser.createMany({ data: data.groupUsers });
//   await db.groupCard.createMany({ data: data.groupCards });
//   await db.cardImage.createMany({ data: data.cardImages });
//   await db.cardQuote.createMany({ data: data.cardQuotes });
//   await db.cardVoiceRecording.createMany({ data: data.cardVoiceRecordings });
//   await db.cardBackgroundColor.createMany({ data: data.cardBackgroundColors });

//   console.log("Seed data inserted successfully");
// }

// seed();
