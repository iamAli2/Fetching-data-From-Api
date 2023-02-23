import 'package:api/pages/MyHomePage2.dart';
import 'package:api/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'pages/Myhomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.home2,
      routes: {
        MyRoutes.home1: (context) => MyHomePage(),
        MyRoutes.home2: (context) => MyHomePage2(),
      },
    );
  }
}
