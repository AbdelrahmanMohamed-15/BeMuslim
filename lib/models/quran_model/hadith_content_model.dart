class HadithContentModel {
  int? id;
  String? content;
  String? sanad;

  HadithContentModel({this.id, this.content, this.sanad});

  factory HadithContentModel.fromJson(Map<String, dynamic> json) {
    HadithContentModel hadithContentModel = HadithContentModel();
    hadithContentModel.id = json['Hadith_ID'];
    hadithContentModel.content = json['Ar_Text_Without_Tashkeel'];
    hadithContentModel.sanad = json['Ar_Sanad_Without_Tashkeel'];
    return hadithContentModel;
  }
}
