import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_chat/widgets/chat_app.dart';

void main() {
  testWidgets('shows a progress indicator while connecting', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ChatApp()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Closes the client, and lets the connection attempt's timer run out.
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(minutes: 1));
  });
}
