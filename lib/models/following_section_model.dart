// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:tiktok_clone/models/user_model.dart';

part 'following_section_model.g.dart';

@JsonSerializable(explicitToJson: true)
@JsonStringToInt()
class FollowingSectionModel extends Equatable {
  final String type;
  final int id;
  final String playlist;
  final String description;
  @JsonKey(name: "flashcard_front")
  final String flashCardFront;
  @JsonKey(name: "flashcard_back")
  final String flashCardback;
  final UserModel user;

  const FollowingSectionModel({
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

  @override
  List<Object> get props {
    return [
      type,
      id,
      playlist,
      description,
      flashCardFront,
      flashCardback,
    ];
  }
}

class JsonStringToInt implements JsonConverter<int, dynamic> {
  const JsonStringToInt();

  @override
  int fromJson(dynamic json) {
    if (json is num) {
      return json.toInt();
    }
    return int.tryParse(json) ?? 0;
  }

  @override
  String toJson(int object) => object.toString();
}
