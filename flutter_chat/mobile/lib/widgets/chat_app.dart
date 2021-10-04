import 'package:flutter/material.dart';
import 'chat_home.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatHome(),
    );
  }
}
