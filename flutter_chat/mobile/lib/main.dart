import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/chat_app.dart';

enum ChatState { isNotConnected, isConnected, hasSentAuth, hasUser, hasError }

final chatStateProvider = StateProvider((ref) => ChatState.isNotConnected);

void main() {
  runApp(const ChatApp());
}
