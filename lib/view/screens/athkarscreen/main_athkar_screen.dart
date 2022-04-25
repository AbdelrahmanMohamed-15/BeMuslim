import 'package:azkaar/view/widget/build_athkar_listtile.dart';
import 'package:flutter/material.dart';

class MainAthkarScreen extends StatelessWidget {
  static const String RouteName = '/AthkarScreen';
  const MainAthkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2d6a4f),
        centerTitle: true,
        title: const Text(
          'Athkar',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 7,
            width: 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF2d6a4f),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BuildAthkarList(
              img: 'assets/morning.jpg',
              title: 'Morning Athkar',
              routeName: '/Morning',
            ),
            BuildAthkarList(
              img: 'assets/night.jpg',
              title: 'Evening Athkar',
              routeName: '/EveningScreen',
            ),
          ],
        ),
      ),
    ));
  }
}
