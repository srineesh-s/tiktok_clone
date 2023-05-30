import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_clone/screens/home_screen.dart';
import 'package:tiktok_clone/screens/tiktok_screen/bloc/tik_tok_bloc_bloc.dart';
import 'package:tiktok_clone/screens/tiktok_screen/repository/tiktok_repository.dart';
import 'package:tiktok_clone/services/api_client.dart';

void main() {
  late Widget sut;
  setUp(() {
    sut = sut = MaterialApp(
      home: BlocProvider<TikTokBlocBloc>(
        create: (context) =>
            TikTokBlocBloc(TikTokSectionRepository(ApiClient())),
        child: const HomeScreen(),
      ),
    );
  });

  testWidgets("Testing the screen rendering", ((widgetTester) async {
    await widgetTester.pumpWidget(sut);
    expect(find.text("Home"), findsOneWidget);
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the screen rendering for first tab",
      ((widgetTester) async {
    await widgetTester.pumpWidget(sut);
    expect(find.text("10M"), findsOneWidget);
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the tap for second tab", ((widgetTester) async {
    await widgetTester.pumpWidget(sut);
    await widgetTester.tap(find.text("Discover"));
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the tap for third tab", ((widgetTester) async {
    await widgetTester.pumpWidget(sut);
    await widgetTester.tap(find.text("Activity"));
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the tap for fourth tab", ((widgetTester) async {
    await widgetTester.pumpWidget(sut);
    await widgetTester.tap(find.text("BookMarks"));
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the tap for fifth tab", ((widgetTester) async {
    await widgetTester.pumpWidget(sut);
    await widgetTester.tap(find.text("Profile"));
    await widgetTester.pumpAndSettle();
  }));
}
