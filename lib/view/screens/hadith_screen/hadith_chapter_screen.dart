import 'package:azkaar/http_helper.dart/http_helper.dart';
import 'package:azkaar/models/quran_model/hadith_chapter_model.dart';
import 'package:azkaar/view/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'hadith_content_screen.dart';

class HadithChapterScreen extends StatelessWidget {
  int id;
  HadithChapterScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CustomAppBar(title: 'كتاب رقم ${id}'),
          SizedBox(height: 15),
          FutureBuilder<List<HadithChapterModel>>(
              future: HttpHelper().getChapter(id),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HadithContenScreen(
                                        idBook: id,
                                        idChapter:
                                            snapShot.data![index].chID!)));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
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
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  snapShot.data![index].chName!,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      )),
    );
  }
}
