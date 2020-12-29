class DayOfWeek {
    String name;
    String quote;
    String longQuote;
    bool active;

    DayOfWeek({this.name, this.active, this.quote, this.longQuote});
}

var days = <DayOfWeek>[
   DayOfWeek(
     name: "Sun",
     active: false,
     quote: "Gratitude",
     longQuote: "Every Sunday, practice your thankfulness",
   ),
   DayOfWeek(
     name: "Mon",
     active: true,
     quote: "Presence",
     longQuote: "Every Monday, find focus",
   ),
   DayOfWeek(
     name: "Tue",
     active: false,
     quote: "Gratitude",
     longQuote: "Every Tuesday, practice your thankfulness",
   ),
   DayOfWeek(
     name: "Wed",
     active: false,
     quote: "Gratitude",
     longQuote: "Every Wendsday, practice your thankfulness",
   ),
   DayOfWeek(
     name: "Thu",
     active: false,
     quote: "Presence",
     longQuote: "Every Thursday, find focus",
   ),
   DayOfWeek(
     name: "Fri",
     active: false,
     quote: "Presence",
     longQuote: "Every Friday, find focus",
   ),
   DayOfWeek(
     name: "Sat",
     active: false,
     quote: "Presence",
     longQuote: "Every Saturday, find focus",
   ),
];

