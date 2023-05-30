import 'package:json_annotation/json_annotation.dart';

part 'option_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionModel {
  String id;
  String answer;

  OptionModel({
    required this.id,
    required this.answer,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$OptionModelToJson(this);
}
