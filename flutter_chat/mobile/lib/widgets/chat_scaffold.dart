import 'dart:async';
import 'package:angel3_websocket/flutter.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChatScaffold extends StatefulWidget {
  final WebSockets app;

  const ChatScaffold({super.key, required this.app});

  @override
  State<StatefulWidget> createState() => _ChatScaffoldState();
}

class _ChatScaffoldState extends State<ChatScaffold> {
  var messages = <Message>[];
  var users = <User>{};
  final _subs = <StreamSubscription>[];

  @override
  void initState() {
    super.initState();

    // Listen for an incoming message
    _subs.add(widget.app.on['message'].listen((data) {
      print(data);
    }));

    // Listen for when the server sends the message list
    _subs.add(widget.app.on['messages'].listen((data) {
      print(data);
    }));

    // Listen for when a user joins the room
    _subs.add(widget.app.on['user_joined'].listen((data) {
      print(data);
    }));

    // Listen for when a user leaves the room
    _subs.add(widget.app.on['user_left'].listen((data) {
      print(data);
    }));

    // Listen for when the server sends the user list
    _subs.add(widget.app.on['users'].listen((data) {
      print(data);
    }));
  }

  @override
  void deactivate() {
    for (var s in _subs) {
      s.cancel();
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Apps'),
      ),
    );
  }
}
