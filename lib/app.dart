

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home.dart';
class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor:Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: Home(),
    );
  }
}