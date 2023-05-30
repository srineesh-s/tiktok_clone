import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tiktok_clone/models/following_section_model.dart';
import 'package:tiktok_clone/models/for_you_section_model.dart';
import 'package:tiktok_clone/models/user_model.dart';
import 'package:tiktok_clone/screens/tiktok_screen/bloc/tik_tok_bloc_bloc.dart';
import 'package:tiktok_clone/screens/tiktok_screen/repository/tiktok_repository.dart';

import 'tiktok_bloc_test.mocks.dart';

@GenerateMocks([TikTokSectionRepository])
void main() {
  late TikTokSectionRepository tikTokSectionRepository;
  setUp(() {
    tikTokSectionRepository = MockTikTokSectionRepository();
  });
  blocTest<TikTokBlocBloc, TikTokBlocState>(
    'emits FollowingSectionSuccessState when FollowingSectionEvent is added.',
    setUp: () {
      when(tikTokSectionRepository.getFollowingSection()).thenAnswer(
          (realInvocation) async => const FollowingSectionModel(
              description: "description",
              id: 12,
              flashCardFront: "flashCardFront",
              flashCardback: "flashCardback",
              playlist: "playlist",
              type: "type",
              user: UserModel(name: "name", avatar: "avatar")));
    },
    build: () => TikTokBlocBloc(tikTokSectionRepository),
    act: (bloc) => bloc.add(FollowingSectionEvent()),
    expect: () => <TikTokBlocState>[
      LoadingState(),
      FollowingSectionSuccessState(
          followingSectionModel: const FollowingSectionModel(
              description: "description",
              id: 12,
              flashCardFront: "flashCardFront",
              flashCardback: "flashCardback",
              playlist: "playlist",
              type: "type",
              user: UserModel(name: "name", avatar: "avatar")))
    ],
  );
  blocTest<TikTokBlocBloc, TikTokBlocState>(
    'emits ForYouSuccessState when sor you section event is added.',
    setUp: () {
      when(tikTokSectionRepository.forYouSeciton()).thenAnswer(
          (realInvocation) async => const ForYouSectionModel(
              description: "description",
              id: 12,
              question: "question",
              options: [],
              playlist: "playlist",
              type: "type",
              user: UserModel(name: "name", avatar: "avatar")));
    },
    build: () => TikTokBlocBloc(tikTokSectionRepository),
    act: (bloc) => bloc.add(ForYouSectionEvent()),
    expect: () => <TikTokBlocState>[
      LoadingState(),
      ForYouSectionSuccessState(
          forYouSectionModel: const ForYouSectionModel(
              description: "description",
              id: 12,
              question: "question",
              options: [],
              playlist: "playlist",
              type: "type",
              user: UserModel(name: "name", avatar: "avatar")))
    ],
  );
}
