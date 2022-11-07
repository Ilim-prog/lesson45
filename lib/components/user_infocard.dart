import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String num;

  const CustomCard({
    Key? key,
    required this.text,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: 300,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Text(text),
          Spacer(),
          Text(num),
        ],
      ),
    );
  }
}
