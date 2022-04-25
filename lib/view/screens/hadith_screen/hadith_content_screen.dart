import 'package:azkaar/http_helper.dart/http_helper.dart';
import 'package:azkaar/models/quran_model/hadith_content_model.dart';
import 'package:azkaar/view/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class HadithContenScreen extends StatelessWidget {
  int idBook;
  int idChapter;
  HadithContenScreen({
    Key? key,
    required this.idBook,
    required this.idChapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: 'فصل رقم ${idChapter}'),
            SizedBox(height: 15.0),
            FutureBuilder<List<HadithContentModel>>(
                future: HttpHelper().getChapterContent(idBook, idChapter),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return Expanded(
                        child: ListView.builder(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          margin: const EdgeInsets.all(10),
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
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('السند',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                              Text(snapShot.data![index].sanad!,
                                  style: const TextStyle(
                                      color: Color(0xFF52b788),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                              const Divider(
                                color: Colors.white,
                                thickness: 3.0,
                              ),
                              Text(
                                snapShot.data![index].content!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                        );
                      },
                    ));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })
          ],
        ),
      ),
    );
  }
}
