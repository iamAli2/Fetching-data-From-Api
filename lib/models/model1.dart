import 'dart:convert';

List<Postdata> postdataFromJson(String str) => List<Postdata>.from(json.decode(str).map((x) => Postdata.fromJson(x)));

String postdataToJson(List<Postdata> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postdata {
    Postdata({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory Postdata.fromJson(Map<String, dynamic> json) => Postdata(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}