import 'package:flutter/material.dart';
import 'chat_home.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatHome(),
    );
  }
}
