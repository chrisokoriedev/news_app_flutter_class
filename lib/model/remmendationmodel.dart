

import 'dart:convert';

RecommendationModel recommendationModelFromJson(String str) => RecommendationModel.fromJson(json.decode(str));

String recommendationModelToJson(RecommendationModel data) => json.encode(data.toJson());

class RecommendationModel {
  String status;
  int totalResults;
  List<Article> articles;

  RecommendationModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) => RecommendationModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Source source;
  String author;
  String title;
  String? description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String? content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  Id id;
  Name name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: idValues.map[json["id"]]!,
    name: nameValues.map[json["name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "name": nameValues.reverse[name],
  };
}

enum Id { GOOGLE_NEWS, THE_TIMES_OF_INDIA }

final idValues = EnumValues({
  "google-news": Id.GOOGLE_NEWS,
  "the-times-of-india": Id.THE_TIMES_OF_INDIA
});

enum Name { GOOGLE_NEWS, THE_TIMES_OF_INDIA }

final nameValues = EnumValues({
  "Google News": Name.GOOGLE_NEWS,
  "The Times of India": Name.THE_TIMES_OF_INDIA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
