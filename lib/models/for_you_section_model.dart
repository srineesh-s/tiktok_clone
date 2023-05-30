// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:tiktok_clone/models/user_model.dart';

import 'option_model.dart';

part 'for_you_section_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ForYouSectionModel extends Equatable {
  final String type;
  final int id;
  final String playlist;
  final String description;
  final String question;
  final List<OptionModel> options;
  final UserModel user;

  const ForYouSectionModel({
    required this.type,
    required this.id,
    required this.playlist,
    required this.description,
    required this.question,
    required this.options,
    required this.user,
  });

  factory ForYouSectionModel.fromJson(Map<String, dynamic> json) =>
      _$ForYouSectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForYouSectionModelToJson(this);

  @override
  List<Object> get props {
    return [
      type,
      id,
      playlist,
      description,
      question,
      options,
      user,
    ];
  }
}
