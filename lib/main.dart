import 'package:chat_gpt_application/constants/colors.dart';

import 'package:chat_gpt_application/presentation/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: mainScaffoldColor,textTheme:  defaultTextTheme),
      
      
      debugShowCheckedModeBanner: false,
     title: "Chat Gpt App",
     home: const HomeScreen() ,
    );
    
  }
}