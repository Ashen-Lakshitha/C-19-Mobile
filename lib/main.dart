import 'package:covid_app/screens/global.dart';
import 'package:covid_app/screens/stat.dart';
import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';

import 'screens/home_page.dart';

// void main() => runApp(
//   DevicePreview(
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/global" : (context) => Global(),
        "/stat" : (context) => StatData(),
        "/home" : (context) => MyApp(),
      },
    );
  }
}


