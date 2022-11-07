import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lesson45/model/user_model.dart';

class UserCard extends StatelessWidget {
  // final int id;
  final String name;
  const UserCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/photo.png',
            height: 40,
            width: 40,
          ),
          SizedBox(width: 70),
          // Text(id.toString()),
          Text(
            name.toString(),
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
