import 'package:json_annotation/json_annotation.dart';

part 'vendor_model.g.dart';

@JsonSerializable()
class VendorModel {
  final String? id;
  final String name;
  final String? slug;
  final String? description;
  final String? logoUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VendorModel({
    this.id,
    required this.name,
    this.slug,
    this.description,
    this.logoUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);
}
