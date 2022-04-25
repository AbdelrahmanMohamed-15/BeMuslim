import 'package:azkaar/provider/sebha_provider.dart';
import 'package:azkaar/provider/surahs_provider.dart';
import 'package:azkaar/view/qr_screen.dart';
import 'package:azkaar/view/screens/athkarscreen/evening_athkar.dart';
import 'package:azkaar/view/screens/athkarscreen/main_athkar_screen.dart';
import 'package:azkaar/view/screens/athkarscreen/morning_athkar.dart';
import 'package:azkaar/view/screens/prayscreen/adan_time.dart';
import 'package:azkaar/view/screens/prayscreen/permission_qibla_screen.dart';
import 'package:azkaar/view/screens/prayscreen/pray_time_screen.dart';
import 'package:azkaar/view/screens/prayscreen/qibla_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/screens/hadith_screen/hadith_screen.dart';
import 'view/screens/quranscreen/home_screen.dart';
import 'view/screens/quranscreen/quran_Screen.dart';
import 'view/screens/quranscreen/sebha_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SurahsProvider>(create: (_) => SurahsProvider()),
    ChangeNotifierProvider<SebhaProvider>(create: (_) => SebhaProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Azkaar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: QrScreen.RouteName,
        routes: {
          HomeScreen.RouteName: (_) => const HomeScreen(),
          HadithScreen.RouteName: (_) => const HadithScreen(),
          QuranScreen.RouteName: (_) => const QuranScreen(),
          SebhaScreen.RouteName: (_) => const SebhaScreen(),
          PrayScreen.RouteName: (_) => const PrayScreen(),
          AdanTimeScreen.RouteName: (_) => const AdanTimeScreen(),
          QiblaScreen.RouteName: (_) => const QiblaScreen(),
          PerScreen.RouteName: (_) => const PerScreen(),
          MainAthkarScreen.RouteName: (_) => MainAthkarScreen(),
          MorningAthkar.RouteName: (_) => MorningAthkar(),
          EveningScreen.RouteName: (_) => EveningScreen(),
          QrScreen.RouteName: (_) => QrScreen()
        });
  }
}
