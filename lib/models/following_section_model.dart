import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_clone/models/user_model.dart';

part 'following_section_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FollowingSectionModel {
  String type;
  String id;
  String playlist;
  String description;
  @JsonKey(name: "flashcard_front")
  String flashCardFront;
  @JsonKey(name: "flashcard_back")
  String flashCardback;
  UserModel user;

  FollowingSectionModel({
    required this.type,
    required this.id,
    required this.playlist,
    required this.description,
    required this.flashCardFront,
    required this.flashCardback,
    required this.user,
  });

  factory FollowingSectionModel.fromJson(Map<String, dynamic> json) =>
      _$FollowingSectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$FollowingSectionModelToJson(this);
}
