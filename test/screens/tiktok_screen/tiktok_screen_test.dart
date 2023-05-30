import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tiktok_clone/models/following_section_model.dart';
import 'package:tiktok_clone/models/for_you_section_model.dart';
import 'package:tiktok_clone/models/user_model.dart';
import 'package:tiktok_clone/screens/tiktok_screen/bloc/tik_tok_bloc_bloc.dart';
import 'package:tiktok_clone/screens/tiktok_screen/tik_tok_screen.dart';

import 'tiktok_screen_test.mocks.dart';

@GenerateMocks([
  TikTokBlocBloc,
  TikTokBlocInitial,
  LoadingState,
  ForYouSectionSuccessState,
  FollowingSectionSuccessState,
  ErrorState,
])
void main() {
  late Widget sut;
  late MockTikTokBlocBloc mockTikTokBlocBloc;
  late MockTikTokBlocInitial mockTikTokBlocInitial;
  late MockLoadingState mockLoadingState;
  late MockForYouSectionSuccessState mockForYouSectionSuccessState;
  late MockFollowingSectionSuccessState mockFollowingSectionSuccessState;
  late MockErrorState mockErrorState;

  setUp(() {
    mockTikTokBlocBloc = MockTikTokBlocBloc();
    mockTikTokBlocInitial = MockTikTokBlocInitial();
    mockLoadingState = MockLoadingState();
    mockForYouSectionSuccessState = MockForYouSectionSuccessState();
    mockFollowingSectionSuccessState = MockFollowingSectionSuccessState();
    mockErrorState = MockErrorState();

    sut = sut = MaterialApp(
      home: BlocProvider<TikTokBlocBloc>(
        create: (context) => mockTikTokBlocBloc,
        child: const TikTokScreen(),
      ),
    );
  });

  testWidgets("Testing the screen rendering", ((widgetTester) async {
    when(mockTikTokBlocBloc.stream).thenAnswer((realInvocation) =>
        Stream<TikTokBlocState>.fromIterable([mockTikTokBlocInitial]));
    when(mockTikTokBlocBloc.state).thenReturn(mockTikTokBlocInitial);
    await widgetTester.pumpWidget(sut);
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the screen with loading ste", ((widgetTester) async {
    when(mockTikTokBlocBloc.stream).thenAnswer((realInvocation) =>
        Stream<TikTokBlocState>.fromIterable([mockLoadingState]));
    when(mockTikTokBlocBloc.state).thenReturn(mockLoadingState);
    await widgetTester.pumpWidget(sut);
  }));
  testWidgets("Testing the screen with Error state ", ((widgetTester) async {
    when(mockTikTokBlocBloc.stream).thenAnswer((realInvocation) =>
        Stream<TikTokBlocState>.fromIterable([mockErrorState]));
    when(mockTikTokBlocBloc.state).thenReturn(mockErrorState);
    await widgetTester.pumpWidget(sut);
    expect(find.text("Something went wrong"), findsOneWidget);
  }));
  testWidgets("Testing the screen with FollowingSectionSuccessState",
      ((widgetTester) async {
    when(mockFollowingSectionSuccessState.followingSectionModel).thenReturn(
        const FollowingSectionModel(
            description: "description",
            id: 12,
            flashCardFront: "flashCardFront",
            flashCardback: "flashCardback",
            playlist: "playlist",
            type: "type",
            user: UserModel(name: "name", avatar: "avatar")));
    when(mockTikTokBlocBloc.stream).thenAnswer((realInvocation) =>
        Stream<TikTokBlocState>.fromIterable(
            [mockFollowingSectionSuccessState]));
    when(mockTikTokBlocBloc.state).thenReturn(mockFollowingSectionSuccessState);
    await widgetTester.pumpWidget(sut);
    expect(find.text("flashCardFront"), findsOneWidget);
  }));
  testWidgets("Testing the screen with ForYouSectionSuccessState",
      ((widgetTester) async {
    when(mockForYouSectionSuccessState.forYouSectionModel).thenReturn(
        const ForYouSectionModel(
            description: "description",
            id: 12,
            question: "question",
            options: [],
            playlist: "playlist",
            type: "type",
            user: UserModel(name: "name", avatar: "avatar")));
    when(mockTikTokBlocBloc.stream).thenAnswer((realInvocation) =>
        Stream<TikTokBlocState>.fromIterable([mockForYouSectionSuccessState]));
    when(mockTikTokBlocBloc.state).thenReturn(mockForYouSectionSuccessState);
    await widgetTester.pumpWidget(sut);
    expect(find.text("question"), findsOneWidget);
  }));
}
