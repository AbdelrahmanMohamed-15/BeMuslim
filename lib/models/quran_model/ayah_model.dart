class AyahModel {
  int? id;
  int? verseNumber;
  String? verseKey;
  int? juzNumber;
  int? hizbNumber;
  int? rubNumber;
  String? sajdahType;
  int? pageNumber;

  AyahModel({
    this.id,
    this.verseNumber,
    this.verseKey,
    this.juzNumber,
    this.hizbNumber,
    this.rubNumber,
    this.sajdahType,
    this.pageNumber,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    AyahModel ayahModel = AyahModel();
    ayahModel.id = json['id'];
    ayahModel.verseNumber = json['verse_number'];
    ayahModel.verseKey = json['verse_key'];
    ayahModel.juzNumber = json['juz_number'];
    ayahModel.hizbNumber = json['hizb_number'];
    ayahModel.rubNumber = json['rub_number'];
    ayahModel.sajdahType = json['sajdah_type'];
    ayahModel.pageNumber = json['page_number'];
    return ayahModel;
  }
}
