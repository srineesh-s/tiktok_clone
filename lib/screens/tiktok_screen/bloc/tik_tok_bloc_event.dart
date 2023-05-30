part of 'tik_tok_bloc_bloc.dart';

@immutable
abstract class TikTokBlocEvent extends Equatable {}

class ForYouSectionEvent extends TikTokBlocEvent {
  @override
  List<Object?> get props => [];
}

class FollowingSectionEvent extends TikTokBlocEvent {
  @override
  List<Object?> get props => [];
}
