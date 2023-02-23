import 'dart:convert';

List<Picarts> picartsFromJson(String str) => List<Picarts>.from(json.decode(str).map((x) => Picarts.fromJson(x)));

String picartsToJson(List<Picarts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Picarts {
    Picarts({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    factory Picarts.fromJson(Map<String, dynamic> json) => Picarts(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
