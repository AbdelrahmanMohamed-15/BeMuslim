import 'dart:ui';

import 'package:azkaar/view/screens/quranscreen/quran_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:azkaar/provider/surahs_provider.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SurahsProvider>(context).fetchSurahs();
    return SafeArea(
      child: Scaffold(
        body: Consumer<SurahsProvider>(
          builder: (context, surahs, child) {
            return ListView.builder(
                itemCount: surahs.surahsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => QuranPageScreen(
                                  page:
                                      surahs.surahsList[index].pages!.first)));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xFF2d6a4f),
                            Color(0xFF40916c),
                            Color(0xFF2d6a4f),
                          ]),
                          border:
                              Border.all(color: Color(0xFF081c15), width: 2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            surahs.surahsList[index].englishName!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              surahs.surahsList[index].id!.toString(),
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color(0xFF001654),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          trailing: Text(
                            surahs.surahsList[index].nameArabic!,
                            style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}

// class AyahsScreen extends StatelessWidget {
//   int id;
//   String name;
//   bool basmallah;
//   AyahsScreen({
//     Key? key,
//     required this.id,
//     required this.name,
//     required this.basmallah,
//   }) : super(key: key);

