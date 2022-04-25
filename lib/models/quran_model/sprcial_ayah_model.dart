class SpecialAyahModel {
  int? id;
  String? verseKey;
  String? text;

  SpecialAyahModel({
    this.id,
    this.verseKey,
    this.text,
  });

  factory SpecialAyahModel.fromJson(Map<String, dynamic> json) {
    SpecialAyahModel specialAyahModel = SpecialAyahModel();
    specialAyahModel.id = json['id'];
    specialAyahModel.verseKey = json['verse_key'];
    specialAyahModel.text = json['text_uthmani'];
    return specialAyahModel;
  }
}
