import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_clone/models/user_model.dart';

part 'following_section_model.g.dart';

@JsonSerializable(explicitToJson: true)
@JsonStringToInt()
class FollowingSectionModel {
  String type;
  int id;
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
