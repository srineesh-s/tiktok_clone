// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionModel extends Equatable {
  final String id;
  final String answer;

  const OptionModel({
    required this.id,
    required this.answer,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$OptionModelToJson(this);

  @override
  List<Object> get props => [id, answer];
}
