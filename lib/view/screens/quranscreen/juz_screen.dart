import 'package:flutter/material.dart';

class JuzScreen extends StatelessWidget {
  const JuzScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF2d6a4f),
                    Color(0xFF40916c),
                    Color(0xFF2d6a4f),
                  ]),
                  border: Border.all(color: Color(0xFF081c15), width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        '${index + 1}',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color(0xFF001654),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 7.0),
                    Text(
                      'جزء رقم  ${index + 1}',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }));
  }
}
