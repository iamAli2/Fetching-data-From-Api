import 'dart:convert';
import 'package:api/models/model1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Postdata> samplepost = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: samplepost.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blueGrey,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "User_Id: ${samplepost[index].userId}"
                            .text
                            .bold
                            .xl2
                            .make(),
                        "Id:  ${samplepost[index].id}".text.bold.xl2.make(),
                        "Title:  ${samplepost[index].title}"
                            .text
                            .bold
                            .xl2
                            .make(),
                        "Body:  ${samplepost[index].body}".text.xl2.make(),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Postdata>> getData() async {
    final duration = await Future.delayed(Duration(seconds: 2));
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplepost.add(Postdata.fromJson(index));
      }
      return samplepost;
    } else {
      return samplepost;
    }
  }
}
