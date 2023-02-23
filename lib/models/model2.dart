import 'dart:convert';

List<CommentPost> commentPostFromJson(String str) => List<CommentPost>.from(json.decode(str).map((x) => CommentPost.fromJson(x)));

String commentPostToJson(List<CommentPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentPost {
    CommentPost({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    int postId;
    int id;
    String name;
    String email;
    String body;

    factory CommentPost.fromJson(Map<String, dynamic> json) => CommentPost(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
