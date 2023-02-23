import 'package:api/models/model2.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHomePage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  List<CommentPost> commentsample = [];
  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<List<CommentPost>> getdata() async {
    final duration = await Future.delayed(Duration(seconds: 2));
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        commentsample.add(CommentPost.fromJson(index));
      }
      return commentsample;
    } else {
      return commentsample;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Api Part3".text.xl3.make(),
      ),
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: commentsample.length,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.all(10),
                    color: Color.fromARGB(255, 58, 91, 183),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Post_Id :${commentsample[index].postId}"
                            .text
                            .bold
                            .xl2
                            .make(),
                        "Id :${commentsample[index].id}".text.xl2.make(),
                        "Email :${commentsample[index].email}".text.xl2.make(),
                        "Body :${commentsample[index].body}".text.xl2.make(),
                      ],
                    ),
                  );
                }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
