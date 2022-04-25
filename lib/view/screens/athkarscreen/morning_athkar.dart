import 'package:azkaar/view/screens/athkarscreen/athkar_content.dart';
import 'package:flutter/material.dart';

class MorningAthkar extends StatefulWidget {
  static const String RouteName = '/Morning';
  const MorningAthkar({Key? key}) : super(key: key);

  @override
  _MorningAthkarState createState() => _MorningAthkarState();
}

class _MorningAthkarState extends State<MorningAthkar> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF2d6a4f),
      appBar: AppBar(
        backgroundColor: Color(0xFF2d6a4f),
        centerTitle: true,
        title: const Text(
          'Morning Athkar',
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
              color: Color(0xFF00061a),
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 31,
          itemBuilder: (context, index) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFe9c46a),
                    Color(0xFFfdffb6),
                    Color(0xFFe9c46a),
                  ]),
                  border: Border.all(color: Color(0xFF081c15), width: 2),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${Morning().Bsmallah[index]}',
                      style: TextStyle(
                          color: Color(0xFF2d6a4f),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  SizedBox(height: 15.0),
                  Text('${Morning().Athkar[index]}',
                      style: const TextStyle(
                          color: Color(0xFF081c15),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const Divider(
                    color: Color(0xFF081c15),
                    thickness: 3.0,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    '${Morning().Details[index]}',
                    style: const TextStyle(
                        color: Color(0xFF2d6a4f),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xFF081c15),
                          border:
                              Border.all(width: 2, color: Color(0xFF2d6a4f))),
                      child: Center(
                        child: Text(
                          '${Morning().count[index]}',
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              )),
            );
          }),
    ));
  }
}
