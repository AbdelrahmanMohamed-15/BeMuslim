import 'package:azkaar/http_helper.dart/http_helper.dart';
import 'package:azkaar/models/quran_model/book_name.dart';
import 'package:azkaar/view/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'hadith_chapter_screen.dart';

class HadithScreen extends StatelessWidget {
  static const String RouteName = '/HadithScreen';
  const HadithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'الآحاديث'),
          SizedBox(height: 15.0),
          FutureBuilder<List<BookName>>(
              future: HttpHelper().getBooks(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HadithChapterScreen(
                                          id: snapshot.data![index].id!)));
                            },
                            child: Container(
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF0b525b),
                                        Color(0xFF065a60),
                                        Color(0xFF0b525b),
                                      ]),
                                  border: Border.all(
                                      color: Color(0xFF52b788), width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: ListTile(
                                    title: Text(
                                      snapshot.data![index].name!,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          );
                        }),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    ));
  }
}
