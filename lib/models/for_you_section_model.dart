import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_clone/models/user_model.dart';

import 'option_model.dart';

part 'for_you_section_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ForYouSectionModel {
  String type;
  String id;
  String playlist;
  String description;
  String question;
  List<OptionModel> options;
  UserModel user;

  ForYouSectionModel({
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
}
