// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'for_you_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForYouSectionModel _$ForYouSectionModelFromJson(Map<String, dynamic> json) =>
    ForYouSectionModel(
      type: json['type'] as String,
      id: json['id'] as String,
      playlist: json['playlist'] as String,
      description: json['description'] as String,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForYouSectionModelToJson(ForYouSectionModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'playlist': instance.playlist,
      'description': instance.description,
      'question': instance.question,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'user': instance.user.toJson(),
    };
