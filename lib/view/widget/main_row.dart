import 'package:flutter/material.dart';

class MainRow extends StatelessWidget {
  Icon icon;
  Text text;
  MainRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 7.0,
          ),
          text
        ],
      ),
    );
  }
}
