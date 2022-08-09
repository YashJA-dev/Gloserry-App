import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/widgets/transectionlist.dart';
import './model/Item.dart';
import 'package:intl/intl.dart';

import 'Home.dart';
import 'controller/InputController.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.black,
        primarySwatch: Colors.purple,
      ),
      home: Home(),
    );
  }
}
