class HadithChapterModel {
  int? chID;
  String? chName;

  HadithChapterModel({this.chID, this.chName});

  factory HadithChapterModel.fromJson(Map<String, dynamic> json) {
    HadithChapterModel hadithChapterModel = HadithChapterModel();
    hadithChapterModel.chID = json['Chapter_ID'];
    hadithChapterModel.chName = json['Chapter_Name'];
    return hadithChapterModel;
  }
}
