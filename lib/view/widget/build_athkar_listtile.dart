import 'package:flutter/material.dart';

class BuildAthkarList extends StatelessWidget {
  String img;
  String title;
  String routeName;
  BuildAthkarList({
    Key? key,
    required this.img,
    required this.title,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (routeName != '') {
          Navigator.of(context).pushNamed(routeName);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        width: double.infinity,
        height: 80.0,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
              opacity: 0.65,
            ),
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xFF001654)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
