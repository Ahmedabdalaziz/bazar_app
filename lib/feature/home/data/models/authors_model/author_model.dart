import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel {
  final String? id;
  final String name;
  final String? photoUrl;
  final String? about;
  final String? role;
  final double avgRating;
  final int reviewCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AuthorModel({
    this.id,
    required this.name,
    this.photoUrl,
    this.about,
    this.role,
    this.avgRating = 0.0,
    this.reviewCount = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}
