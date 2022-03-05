import 'package:flutter/material.dart';
import 'package:sliver_appbar_with_tabbar/sliver_appbar_customize.dart';

void main() {
  runApp(const MyApp());
}

List<String> list =[
  'assets/images/one.png','assets/images/four.png',
  'assets/images/two.png','assets/images/five.png',
  'assets/images/three.png','assets/images/six.png',
  ];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: Customize_Sliver_AppBar(list),
      );
  }
  
  }