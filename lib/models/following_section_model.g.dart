// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowingSectionModel _$FollowingSectionModelFromJson(
        Map<String, dynamic> json) =>
    FollowingSectionModel(
      type: json['type'] as String,
      id: json['id'] as String,
      playlist: json['playlist'] as String,
      description: json['description'] as String,
      flashCardFront: json['flashcard_front'] as String,
      flashCardback: json['flashcard_back'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowingSectionModelToJson(
        FollowingSectionModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'playlist': instance.playlist,
      'description': instance.description,
      'flashcard_front': instance.flashCardFront,
      'flashcard_back': instance.flashCardback,
      'user': instance.user.toJson(),
    };