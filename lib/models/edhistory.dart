import 'package:json_annotation/json_annotation.dart';

part 'edhistory.g.dart';

/// Portfolio edhistory synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class EdHistory {
  const EdHistory({
    required this.educationTitle,
    required this.school,
    required this.description,
    required this.startedAtYear,
    this.endedAtYear,
    this.id,
  });

  factory EdHistory.fromJson(Map<String, dynamic> json) =>
      _$EdHistoryFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;

  final String educationTitle;
  final String school;
  final String description;
  final int startedAtYear;

  @JsonKey(defaultValue: null)
  final int? endedAtYear;

  Map<String, dynamic> toJson() => _$EdHistoryToJson(this);
}
