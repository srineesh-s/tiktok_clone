part of 'tik_tok_bloc_bloc.dart';

@immutable
abstract class TikTokBlocEvent {}

class ForYouSectionEvent extends TikTokBlocEvent {}

class FollowingSectionEvent extends TikTokBlocEvent {}

class AnswerSelectedEvent extends TikTokBlocEvent {}
