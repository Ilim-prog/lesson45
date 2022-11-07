import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson45/model/user_model.dart';
import 'package:lesson45/screens/user_info/info_screen.dart';
import 'package:lesson45/screens/users_screen/user_screen.dart';

import 'screens/users_screen/bloc/users_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserScreen(),
    );
  }
}
