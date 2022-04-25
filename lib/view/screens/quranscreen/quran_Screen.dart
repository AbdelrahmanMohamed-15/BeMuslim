import 'package:azkaar/provider/surahs_provider.dart';
import 'package:azkaar/view/screens/quranscreen/surahs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'juz_screen.dart';

class QuranScreen extends StatelessWidget {
  static const String RouteName = '/QuranScreen';
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SurahsProvider>(context).fetchSurahs();
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF2d6a4f),
            centerTitle: true,
            title: const Text(
              'Quran',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.white),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF00061a),
                ),
              ),
            ),
            bottom: const TabBar(
              labelColor: Color(0xFF081c15),
              tabs: [
                Tab(
                    text: 'Surahs',
                    icon: Icon(
                      Icons.home,
                      color: Colors.amber,
                    )),
                // Tab(
                //     text: 'Juz',
                //     icon: Icon(
                //       Icons.home,
                //       color: Colors.amber,
                //     )),
                Tab(
                    text: 'Book Mark',
                    icon: Icon(
                      Icons.star,
                      color: Colors.amber,
                    )),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: TabBarView(
              children: [
                const SurahScreen(),
                //const JuzScreen(),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
