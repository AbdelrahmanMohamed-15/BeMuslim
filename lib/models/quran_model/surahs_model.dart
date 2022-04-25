class SurahsModel {
  int? id;
  String? reveTyper;
  bool? bismillah;
  String? nameArabic;
  String? englishName;
  int? verses;
  List? pages;

  SurahsModel(
      {this.id,
      this.reveTyper,
      this.bismillah,
      this.nameArabic,
      this.englishName,
      this.verses,
      this.pages});

  factory SurahsModel.fromJson(Map<String, dynamic> json) {
    SurahsModel surahsModel = SurahsModel();
    surahsModel.id = json['id'];
    surahsModel.reveTyper = json['revelation_place'];
    surahsModel.bismillah = json['bismillah_pre'];
    surahsModel.nameArabic = json['name_arabic'];
    surahsModel.englishName = json['name_simple'];
    surahsModel.verses = json['verses_count'];
    surahsModel.pages = json['pages'];
    return surahsModel;
  }
}
