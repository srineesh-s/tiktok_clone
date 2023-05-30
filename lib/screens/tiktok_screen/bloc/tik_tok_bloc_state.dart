// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tik_tok_bloc_bloc.dart';

@immutable
abstract class TikTokBlocState extends Equatable {}

class TikTokBlocInitial extends TikTokBlocState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends TikTokBlocState {
  @override
  List<Object?> get props => [];
}

class ForYouSectionSuccessState extends TikTokBlocState {
  final ForYouSectionModel forYouSectionModel;
  ForYouSectionSuccessState({
    required this.forYouSectionModel,
  });
  @override
  List<Object?> get props => [forYouSectionModel];
}

class FollowingSectionSuccessState extends TikTokBlocState {
  final FollowingSectionModel followingSectionModel;
  FollowingSectionSuccessState({
    required this.followingSectionModel,
  });
  @override
  List<Object?> get props => [followingSectionModel];
}

class ErrorState extends TikTokBlocState {
  @override
  List<Object?> get props => [];
}
