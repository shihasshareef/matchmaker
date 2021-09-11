import 'package:flutter/material.dart';

import 'package:match_maker/screens/profiles_screen.dart';
import 'common/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.APP_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilesScreen(),
    );
  }
}
