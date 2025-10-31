// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  coverUrl: json['cover_url'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  description: json['description'] as String?,
  publisher: json['publisher'] as String?,
  language: json['language'] as String?,
  pages: (json['pages'] as num?)?.toInt(),
  avgRating: (json['avg_rating'] as num?)?.toDouble(),
  reviewCount: (json['review_count'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  authorId: (json['author_id'] as num?)?.toInt(),
  authorName: json['author_name'] as String?,
  bookAuthors: (json['book_authors'] as List<dynamic>?)
      ?.map((e) => BookAuthor.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'cover_url': instance.coverUrl,
  'price': instance.price,
  'description': instance.description,
  'publisher': instance.publisher,
  'language': instance.language,
  'pages': instance.pages,
  'avg_rating': instance.avgRating,
  'review_count': instance.reviewCount,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'author_id': instance.authorId,
  'author_name': instance.authorName,
  'book_authors': instance.bookAuthors?.map((e) => e.toJson()).toList(),
};

BookAuthor _$BookAuthorFromJson(Map<String, dynamic> json) => BookAuthor(
  authorId: (json['author_id'] as num).toInt(),
  author: Author.fromJson(json['author'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookAuthorToJson(BookAuthor instance) =>
    <String, dynamic>{
      'author_id': instance.authorId,
      'author': instance.author,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) =>
    Author(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
