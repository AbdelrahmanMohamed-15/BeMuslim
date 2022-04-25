import 'package:azkaar/http_helper.dart/http_helper.dart';
import 'package:azkaar/models/quran_model/ayah_model.dart';
import 'package:azkaar/models/quran_model/sprcial_ayah_model.dart';
import 'package:azkaar/models/quran_model/surahs_model.dart';
import 'package:flutter/cupertino.dart';

class SurahsProvider extends ChangeNotifier {
  List<SurahsModel> _surahsList = [];
  List<AyahModel> _oneSurahList = [];
  List<SpecialAyahModel> _specialAyahList = [];

  Future fetchSurahs() async {
    _surahsList = await HttpHelper().getSurahs();
    notifyListeners();
  }

  Future fetchOneSurah(int id) async {
    _oneSurahList = await HttpHelper().getOneSurahs(id);
    notifyListeners();
  }

  Future fetchSpecialAyah(int id) async {
    _specialAyahList = await HttpHelper().getSpecialAyah(id);
    notifyListeners();
  }

  List<SurahsModel> get surahsList => _surahsList;
  List<AyahModel> get oneSurahList => _oneSurahList;
  List<SpecialAyahModel> get specialAyahList => _specialAyahList;
}
