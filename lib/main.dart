import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/Providers/GloceryListProvider.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
      showPerformanceOverlay: true,
      theme: ThemeData(
        accentColor: Colors.black,
        primarySwatch: Colors.purple,
      ),
      home: ChangeNotifierProvider(
        create: (context) => GloceryList(),
        child: Home(),
      ),
    );
  }
}
