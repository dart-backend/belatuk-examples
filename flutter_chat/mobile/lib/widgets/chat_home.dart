import 'package:angel3_websocket/flutter.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart' hide State;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

class ChatHome extends ConsumerStatefulWidget {
  const ChatHome({super.key});

  @override
  ConsumerState<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends ConsumerState<ChatHome> {
  WebSockets? app;
  User? user;

  // Because WebSockets are asynchronous in nature,
  // we're using a state machine to manage state changes.
  //late Machine chatState;
  //late State isNotConnected, isConnected, hasSentAuth, hasUser, hasError;
  //late Transition connect, sendAuth, setUser, setError;

  @override
  void initState() {
    // Create the client.
    app = WebSockets('ws://localhost:3000/ws');

    // Initialize the state machine...
    /*
    chatState = Machine<String>();

    isNotConnected = chatState.newState('not_connected');
    isConnected = chatState.newState('connected');
    hasSentAuth = chatState.newState('sent_auth');
    hasUser = chatState.newState('has_user');
    hasError = chatState.newState('has_error');
    
    
    connect =
        chatState.newTransition('connect', [isNotConnected], isConnected);
    sendAuth =
        chatState.newStateTransition('send_auth', [isConnected], hasSentAuth);
    setUser = chatState.newStateTransition('set_user', [hasSentAuth], hasUser);
    setError = chatState.newStateTransition('set_error', [State.any], hasError);
    

    setUser.stream.listen((details) {
      setState(() {
        user = details.payload as User;
      });
    });
    chatState.start(isNotConnected);
    */

    // Actually connect now...
    app?.connect().then((_) {
      //setState(connect);
      ref.read(chatStateProvider.notifier).state = ChatState.isConnected;
    }).catchError((e, st) {
      //setState(setError);
      ref.read(chatStateProvider.notifier).state = ChatState.hasError;
      print(e);
      print(st);
    });

    super.initState();
  }

  @override
  void deactivate() {
    app?.close();
    ref.read(chatStateProvider.notifier).state = ChatState.isNotConnected;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return const ChatPanel();
  }
}

class ChatPanel extends ConsumerWidget {
  const ChatPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatState currentChatState = ref.watch(chatStateProvider);

    if (currentChatState == ChatState.isNotConnected) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (currentChatState == ChatState.hasError) {
      return const Scaffold(
        body: Center(
          child: Text(
            'Whoops! Something went wrong.\nIs the server running?',
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text('TODO: support state `${currentChatState.name}`'),
        ),
      );
    }
  }
}
