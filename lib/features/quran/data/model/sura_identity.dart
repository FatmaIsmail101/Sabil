class SuraIdentity {
  final String suraNameEn;
  final String suraNameAr;
  final int versusNumber;

  SuraIdentity({
    required this.suraNameEn,
    required this.suraNameAr,
    required this.versusNumber,
  });
  // 1. أضف هذه الدالة لتحويل الكائن إلى Map
  Map<String, dynamic> toJson() {
    return {
      'suraNameAr': suraNameAr,
      'suraNameEn': suraNameEn,
      'versusNumber': versusNumber,
    };
  }

  factory SuraIdentity.fromJson(Map<String, dynamic> json) {
    return SuraIdentity(
      suraNameEn: json["suraNameEn"],
      suraNameAr: json["suraNameAr"],
      versusNumber: json["versusNumber"],
    );
  }
  static List<SuraIdentity> quranSuras = [
    SuraIdentity(
      suraNameAr: "الفاتحة",
      suraNameEn: "Al-Fatiha",
      versusNumber: 7,
    ),
    SuraIdentity(
      suraNameAr: "البقرة",
      suraNameEn: "Al-Baqarah",
      versusNumber: 286,
    ),
    SuraIdentity(
      suraNameAr: "آل عمران",
      suraNameEn: "Ali 'Imran",
      versusNumber: 200,
    ),
    SuraIdentity(
      suraNameAr: "النساء",
      suraNameEn: "An-Nisa",
      versusNumber: 176,
    ),
    SuraIdentity(
      suraNameAr: "المائدة",
      suraNameEn: "Al-Ma'idah",
      versusNumber: 120,
    ),
    SuraIdentity(
      suraNameAr: "الأنعام",
      suraNameEn: "Al-An'am",
      versusNumber: 165,
    ),
    SuraIdentity(
      suraNameAr: "الأعراف",
      suraNameEn: "Al-A'raf",
      versusNumber: 206,
    ),
    SuraIdentity(
      suraNameAr: "الأنفال",
      suraNameEn: "Al-Anfal",
      versusNumber: 75,
    ),
    SuraIdentity(
      suraNameAr: "التوبة",
      suraNameEn: "At-Tawbah",
      versusNumber: 129,
    ),
    SuraIdentity(suraNameAr: "يونس", suraNameEn: "Yunus", versusNumber: 109),
    SuraIdentity(suraNameAr: "هود", suraNameEn: "Hud", versusNumber: 123),
    SuraIdentity(suraNameAr: "يوسف", suraNameEn: "Yusuf", versusNumber: 111),
    SuraIdentity(suraNameAr: "الرعد", suraNameEn: "Ar-Ra'd", versusNumber: 43),
    SuraIdentity(
      suraNameAr: "إبراهيم",
      suraNameEn: "Ibrahim",
      versusNumber: 52,
    ),
    SuraIdentity(suraNameAr: "الحجر", suraNameEn: "Al-Hijr", versusNumber: 99),
    SuraIdentity(suraNameAr: "النحل", suraNameEn: "An-Nahl", versusNumber: 128),
    SuraIdentity(
      suraNameAr: "الإسراء",
      suraNameEn: "Al-Isra",
      versusNumber: 111,
    ),
    SuraIdentity(suraNameAr: "الكهف", suraNameEn: "Al-Kahf", versusNumber: 110),
    SuraIdentity(suraNameAr: "مريم", suraNameEn: "Maryam", versusNumber: 98),
    SuraIdentity(suraNameAr: "طه", suraNameEn: "Taha", versusNumber: 135),
    SuraIdentity(
      suraNameAr: "الأنبياء",
      suraNameEn: "Al-Anbiya",
      versusNumber: 112,
    ),
    SuraIdentity(suraNameAr: "الحج", suraNameEn: "Al-Hajj", versusNumber: 78),
    SuraIdentity(
      suraNameAr: "المؤمنون",
      suraNameEn: "Al-Mu'minun",
      versusNumber: 118,
    ),
    SuraIdentity(suraNameAr: "النور", suraNameEn: "An-Nur", versusNumber: 64),
    SuraIdentity(
      suraNameAr: "الفرقان",
      suraNameEn: "Al-Furqan",
      versusNumber: 77,
    ),
    SuraIdentity(
      suraNameAr: "الشعراء",
      suraNameEn: "Ash-Shu'ara",
      versusNumber: 227,
    ),
    SuraIdentity(suraNameAr: "النمل", suraNameEn: "An-Naml", versusNumber: 93),
    SuraIdentity(suraNameAr: "القصص", suraNameEn: "Al-Qasas", versusNumber: 88),
    SuraIdentity(
      suraNameAr: "العنكبوت",
      suraNameEn: "Al-Ankabut",
      versusNumber: 69,
    ),
    SuraIdentity(suraNameAr: "الروم", suraNameEn: "Ar-Rum", versusNumber: 60),
    SuraIdentity(suraNameAr: "لقمان", suraNameEn: "Luqman", versusNumber: 34),
    SuraIdentity(
      suraNameAr: "السجدة",
      suraNameEn: "As-Sajdah",
      versusNumber: 30,
    ),
    SuraIdentity(
      suraNameAr: "الأحزاب",
      suraNameEn: "Al-Ahzab",
      versusNumber: 73,
    ),
    SuraIdentity(suraNameAr: "سبأ", suraNameEn: "Saba", versusNumber: 54),
    SuraIdentity(suraNameAr: "فاطر", suraNameEn: "Fatir", versusNumber: 45),
    SuraIdentity(suraNameAr: "يس", suraNameEn: "Ya-Sin", versusNumber: 83),
    SuraIdentity(
      suraNameAr: "الصافات",
      suraNameEn: "As-Saffat",
      versusNumber: 182,
    ),
    SuraIdentity(suraNameAr: "ص", suraNameEn: "Sad", versusNumber: 88),
    SuraIdentity(suraNameAr: "الزمر", suraNameEn: "Az-Zumar", versusNumber: 75),
    SuraIdentity(suraNameAr: "غافر", suraNameEn: "Ghafir", versusNumber: 85),
    SuraIdentity(suraNameAr: "فصلت", suraNameEn: "Fussilat", versusNumber: 54),
    SuraIdentity(
      suraNameAr: "الشورى",
      suraNameEn: "Ash-Shura",
      versusNumber: 53,
    ),
    SuraIdentity(
      suraNameAr: "الزخرف",
      suraNameEn: "Az-Zukhruf",
      versusNumber: 89,
    ),
    SuraIdentity(
      suraNameAr: "الدخان",
      suraNameEn: "Ad-Dukhan",
      versusNumber: 59,
    ),
    SuraIdentity(
      suraNameAr: "الجاثية",
      suraNameEn: "Al-Jathiyah",
      versusNumber: 37,
    ),
    SuraIdentity(
      suraNameAr: "الأحقاف",
      suraNameEn: "Al-Ahqaf",
      versusNumber: 35,
    ),
    SuraIdentity(suraNameAr: "محمد", suraNameEn: "Muhammad", versusNumber: 38),
    SuraIdentity(suraNameAr: "الفتح", suraNameEn: "Al-Fath", versusNumber: 29),
    SuraIdentity(
      suraNameAr: "الحجرات",
      suraNameEn: "Al-Hujurat",
      versusNumber: 18,
    ),
    SuraIdentity(suraNameAr: "ق", suraNameEn: "Qaf", versusNumber: 45),
    SuraIdentity(
      suraNameAr: "الذاريات",
      suraNameEn: "Adh-Dhariyat",
      versusNumber: 60,
    ),
    SuraIdentity(suraNameAr: "الطور", suraNameEn: "At-Tur", versusNumber: 49),
    SuraIdentity(suraNameAr: "النجم", suraNameEn: "An-Najm", versusNumber: 62),
    SuraIdentity(suraNameAr: "القمر", suraNameEn: "Al-Qamar", versusNumber: 55),
    SuraIdentity(
      suraNameAr: "الرحمن",
      suraNameEn: "Ar-Rahman",
      versusNumber: 78,
    ),
    SuraIdentity(
      suraNameAr: "الواقعة",
      suraNameEn: "Al-Waqi'ah",
      versusNumber: 96,
    ),
    SuraIdentity(
      suraNameAr: "الحديد",
      suraNameEn: "Al-Hadid",
      versusNumber: 29,
    ),
    SuraIdentity(
      suraNameAr: "المجادلة",
      suraNameEn: "Al-Mujadilah",
      versusNumber: 22,
    ),
    SuraIdentity(suraNameAr: "الحشر", suraNameEn: "Al-Hashr", versusNumber: 24),
    SuraIdentity(
      suraNameAr: "الممتحنة",
      suraNameEn: "Al-Mumtahanah",
      versusNumber: 13,
    ),
    SuraIdentity(suraNameAr: "الصف", suraNameEn: "As-Saff", versusNumber: 14),
    SuraIdentity(
      suraNameAr: "الجمعة",
      suraNameEn: "Al-Jumu'ah",
      versusNumber: 11,
    ),
    SuraIdentity(
      suraNameAr: "المنافقون",
      suraNameEn: "Al-Munafiqun",
      versusNumber: 11,
    ),
    SuraIdentity(
      suraNameAr: "التغابن",
      suraNameEn: "At-Taghabun",
      versusNumber: 18,
    ),
    SuraIdentity(
      suraNameAr: "الطلاق",
      suraNameEn: "At-Talaq",
      versusNumber: 12,
    ),
    SuraIdentity(
      suraNameAr: "التحريم",
      suraNameEn: "At-Tahrim",
      versusNumber: 12,
    ),
    SuraIdentity(suraNameAr: "الملك", suraNameEn: "Al-Mulk", versusNumber: 30),
    SuraIdentity(suraNameAr: "القلم", suraNameEn: "Al-Qalam", versusNumber: 52),
    SuraIdentity(
      suraNameAr: "الحاقة",
      suraNameEn: "Al-Haqqah",
      versusNumber: 52,
    ),
    SuraIdentity(
      suraNameAr: "المعارج",
      suraNameEn: "Al-Ma'arij",
      versusNumber: 44,
    ),
    SuraIdentity(suraNameAr: "نوح", suraNameEn: "Nuh", versusNumber: 28),
    SuraIdentity(suraNameAr: "الجن", suraNameEn: "Al-Jinn", versusNumber: 28),
    SuraIdentity(
      suraNameAr: "المزمل",
      suraNameEn: "Al-Muzzammil",
      versusNumber: 20,
    ),
    SuraIdentity(
      suraNameAr: "المدثر",
      suraNameEn: "Al-Muddaththir",
      versusNumber: 56,
    ),
    SuraIdentity(
      suraNameAr: "القيامة",
      suraNameEn: "Al-Qiyamah",
      versusNumber: 40,
    ),
    SuraIdentity(
      suraNameAr: "الإنسان",
      suraNameEn: "Al-Insan",
      versusNumber: 31,
    ),
    SuraIdentity(
      suraNameAr: "المرسلات",
      suraNameEn: "Al-Mursalat",
      versusNumber: 50,
    ),
    SuraIdentity(suraNameAr: "النبأ", suraNameEn: "An-Naba", versusNumber: 40),
    SuraIdentity(
      suraNameAr: "النازعات",
      suraNameEn: "An-Nazi'at",
      versusNumber: 46,
    ),
    SuraIdentity(suraNameAr: "عبس", suraNameEn: "Abasa", versusNumber: 42),
    SuraIdentity(
      suraNameAr: "التكوير",
      suraNameEn: "At-Takwir",
      versusNumber: 29,
    ),
    SuraIdentity(
      suraNameAr: "الانفطار",
      suraNameEn: "Al-Infitar",
      versusNumber: 19,
    ),
    SuraIdentity(
      suraNameAr: "المطففين",
      suraNameEn: "Al-Mutaffifin",
      versusNumber: 36,
    ),
    SuraIdentity(
      suraNameAr: "الانشقاق",
      suraNameEn: "Al-Inshiqaq",
      versusNumber: 25,
    ),
    SuraIdentity(
      suraNameAr: "البروج",
      suraNameEn: "Al-Buruj",
      versusNumber: 22,
    ),
    SuraIdentity(
      suraNameAr: "الطارق",
      suraNameEn: "At-Tariq",
      versusNumber: 17,
    ),
    SuraIdentity(suraNameAr: "الأعلى", suraNameEn: "Al-A'la", versusNumber: 19),
    SuraIdentity(
      suraNameAr: "الغاشية",
      suraNameEn: "Al-Ghashiyah",
      versusNumber: 26,
    ),
    SuraIdentity(suraNameAr: "الفجر", suraNameEn: "Al-Fajr", versusNumber: 30),
    SuraIdentity(suraNameAr: "البلد", suraNameEn: "Al-Balad", versusNumber: 20),
    SuraIdentity(
      suraNameAr: "الشمس",
      suraNameEn: "Ash-Shams",
      versusNumber: 15,
    ),
    SuraIdentity(suraNameAr: "الليل", suraNameEn: "Al-Layl", versusNumber: 21),
    SuraIdentity(suraNameAr: "الضحى", suraNameEn: "Ad-Duha", versusNumber: 11),
    SuraIdentity(suraNameAr: "الشرح", suraNameEn: "Ash-Sharh", versusNumber: 8),
    SuraIdentity(suraNameAr: "التين", suraNameEn: "At-Tin", versusNumber: 8),
    SuraIdentity(suraNameAr: "العلق", suraNameEn: "Al-Alaq", versusNumber: 19),
    SuraIdentity(suraNameAr: "القدر", suraNameEn: "Al-Qadr", versusNumber: 5),
    SuraIdentity(
      suraNameAr: "البينة",
      suraNameEn: "Al-Bayyinah",
      versusNumber: 8,
    ),
    SuraIdentity(
      suraNameAr: "الزلزلة",
      suraNameEn: "Az-Zalzalah",
      versusNumber: 8,
    ),
    SuraIdentity(
      suraNameAr: "العاديات",
      suraNameEn: "Al-Adiyat",
      versusNumber: 11,
    ),
    SuraIdentity(
      suraNameAr: "القارعة",
      suraNameEn: "Al-Qari'ah",
      versusNumber: 11,
    ),
    SuraIdentity(
      suraNameAr: "التكاثر",
      suraNameEn: "At-Takathur",
      versusNumber: 8,
    ),
    SuraIdentity(suraNameAr: "العصر", suraNameEn: "Al-Asr", versusNumber: 3),
    SuraIdentity(
      suraNameAr: "الهمزة",
      suraNameEn: "Al-Humazah",
      versusNumber: 9,
    ),
    SuraIdentity(suraNameAr: "الفيل", suraNameEn: "Al-Fil", versusNumber: 5),
    SuraIdentity(suraNameAr: "قريش", suraNameEn: "Quraysh", versusNumber: 4),
    SuraIdentity(
      suraNameAr: "الماعون",
      suraNameEn: "Al-Ma'un",
      versusNumber: 7,
    ),
    SuraIdentity(
      suraNameAr: "الكوثر",
      suraNameEn: "Al-Kawthar",
      versusNumber: 3,
    ),
    SuraIdentity(
      suraNameAr: "الكافرون",
      suraNameEn: "Al-Kafirun",
      versusNumber: 6,
    ),
    SuraIdentity(suraNameAr: "النصر", suraNameEn: "An-Nasr", versusNumber: 3),
    SuraIdentity(suraNameAr: "المسد", suraNameEn: "Al-Masad", versusNumber: 5),
    SuraIdentity(
      suraNameAr: "الإخلاص",
      suraNameEn: "Al-Ikhlas",
      versusNumber: 4,
    ),
    SuraIdentity(suraNameAr: "الفلق", suraNameEn: "Al-Falaq", versusNumber: 5),
    SuraIdentity(suraNameAr: "الناس", suraNameEn: "An-Nas", versusNumber: 6),
  ];
}
