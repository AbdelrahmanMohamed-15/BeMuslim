import 'dart:convert';

import 'package:azkaar/models/adan_models/adan_model.dart';
import 'package:azkaar/models/quran_model/ayah_model.dart';
import 'package:azkaar/models/quran_model/sprcial_ayah_model.dart';
import 'package:azkaar/models/quran_model/surahs_model.dart';
import 'package:http/http.dart' as http;

import 'package:azkaar/models/quran_model/book_name.dart';
import 'package:azkaar/models/quran_model/hadith_chapter_model.dart';
import 'package:azkaar/models/quran_model/hadith_content_model.dart';

class HttpHelper {
  // Get Hadith Books
  List<BookName> booklist = [];
  Future<List<BookName>> getBooks() async {
    http.Response response = await http
        .get(Uri.parse('https://ahadith-api.herokuapp.com/api/books/ar'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Map<String, dynamic>> decodedata =
          List<Map<String, dynamic>>.from(data['Books']);
      booklist = decodedata.map((e) => BookName.fromJson(e)).toList();
    } else {
      print(response.statusCode);
    }
    return booklist;
  }

  //Get Hadith Chapters
  List<HadithChapterModel> chapter = [];
  Future<List<HadithChapterModel>> getChapter(int id) async {
    http.Response response = await http
        .get(Uri.parse('https://ahadith-api.herokuapp.com/api/chapter/$id/ar'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Map<String, dynamic>> decode =
          List<Map<String, dynamic>>.from(data['Chapter']);
      chapter = decode.map((e) => HadithChapterModel.fromJson(e)).toList();
    } else {
      print(response.statusCode);
    }
    return chapter;
  }

  //Get Hadith Chapters Content
  List<HadithContentModel> chaptercontent = [];
  Future<List<HadithContentModel>> getChapterContent(
      int idBook, int idChapter) async {
    http.Response response = await http.get(Uri.parse(
        'https://ahadith-api.herokuapp.com/api/ahadith/$idBook/$idChapter/ar-notashkeel'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Map<String, dynamic>> decode =
          List<Map<String, dynamic>>.from(data['Chapter']);
      chaptercontent =
          decode.map((e) => HadithContentModel.fromJson(e)).toList();
    } else {
      print(response.statusCode);
    }
    return chaptercontent;
  }

  //Get Surahs Of Quran
  List<SurahsModel> surahs = [];
  Future<List<SurahsModel>> getSurahs() async {
    http.Response response = await http
        .get(Uri.parse('https://api.quran.com/api/v4/chapters?language=ar'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Map<String, dynamic>> decoding =
          List<Map<String, dynamic>>.from(data['chapters']);
      surahs = decoding.map((e) => SurahsModel.fromJson(e)).toList();
    } else {
      print(response.statusCode);
    }
    return surahs;
  }

  //Get One Surahs
  List<AyahModel> Onesurahs = [];
  Future<List<AyahModel>> getOneSurahs(int id) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.quran.com/api/v4/verses/by_chapter/$id?language=ar&words=false&per_page=100'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Map<String, dynamic>> decoding =
          List<Map<String, dynamic>>.from(data['verses']);
      Onesurahs = decoding.map((e) => AyahModel.fromJson(e)).toList();
    } else {
      print(response.statusCode);
    }
    return Onesurahs;
  }

  //Get Special Ayahs
  List<SpecialAyahModel> specialAyah = [];
  Future<List<SpecialAyahModel>> getSpecialAyah(int id) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.quran.com/api/v4/quran/verses/uthmani?chapter_number=$id'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Map<String, dynamic>> decoding =
          List<Map<String, dynamic>>.from(data['verses']);
      specialAyah = decoding.map((e) => SpecialAyahModel.fromJson(e)).toList();
    } else {
      print(response.statusCode);
    }
    return specialAyah;
  }

  //Get Prayer Timer
  var data;
  Future<Data> getPrayTime(String address) async {
    http.Response response = await http.get(Uri.parse(
        'http://api.aladhan.com/v1/timingsByAddress?address=$address'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print(data);
      return Data.fromMap(data);
    } else {
      print(response.statusCode);
    }
    return Data.fromMap(data);
  }
}
