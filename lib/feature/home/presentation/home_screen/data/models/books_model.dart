import 'package:json_annotation/json_annotation.dart';

part 'books_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookModel {
  final int id;
  final String title;
  @JsonKey(name: 'cover_url')
  final String? coverUrl;
  final double? price;
  final String? description;
  final String? publisher;
  final String? language;
  final int? pages;
  @JsonKey(name: 'avg_rating')
  final double? avgRating;
  @JsonKey(name: 'review_count')
  final int? reviewCount;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'author_id')
  final int? authorId;
  @JsonKey(name: 'author_name')
  final String? authorName;
  @JsonKey(name: 'book_authors')
  final List<BookAuthor>? bookAuthors;

  BookModel({
    required this.id,
    required this.title,
    this.coverUrl,
    this.price,
    this.description,
    this.publisher,
    this.language,
    this.pages,
    this.avgRating,
    this.reviewCount,
    this.createdAt,
    this.updatedAt,
    this.authorId,
    this.authorName,
    this.bookAuthors,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}

@JsonSerializable()
class BookAuthor {
  @JsonKey(name: 'author_id')
  final int authorId;
  final Author author;

  BookAuthor({
    required this.authorId,
    required this.author,
  });

  factory BookAuthor.fromJson(Map<String, dynamic> json) =>
      _$BookAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$BookAuthorToJson(this);
}

@JsonSerializable()
class Author {
  final int id;
  final String name;

  Author({
    required this.id,
    required this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) =>
      _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
