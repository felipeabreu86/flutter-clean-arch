import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:flutter_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_clean_arch/src/domain/entities/source.dart';

@Entity(tableName: kArticlesTableName)
class Article extends Equatable {
  const Article({
    this.id,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  @override
  List<Object?> get props {
    return [
      id,
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }

  @override
  bool get stringify => true;
}
