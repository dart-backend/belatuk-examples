import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/chat_app.dart';

enum ChatState { isNotConnected, isConnected, hasSentAuth, hasUser, hasError }

/// The state of the connection to the chat server.
class ChatStateNotifier extends Notifier<ChatState> {
  @override
  ChatState build() => ChatState.isNotConnected;

  /// Changes the state, as the connection does.
  void set(ChatState chatState) => state = chatState;
}

final chatStateProvider = NotifierProvider<ChatStateNotifier, ChatState>(
  ChatStateNotifier.new,
);

void main() {
  // Riverpod's providers, as `chatStateProvider`, live in a ProviderScope.
  runApp(const ProviderScope(child: ChatApp()));
}
