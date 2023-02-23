import 'dart:convert';

import 'package:api/models/model3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  List<Picarts> Pictdata = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<List<Picarts>> getData() async {
    final duration = await Future.delayed(Duration(seconds: 2));
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        Pictdata.add(Picarts.fromJson(index));
      }
      return Pictdata;
    } else {
      return Pictdata;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Api Part3".text.xl3.make(),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: Pictdata.length,
                itemBuilder: ((context, index) {
                  return Container(
                    color: Colors.indigo,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Album_Id : ${Pictdata[index].albumId}"
                            .text
                            .xl2
                            .bold
                            .make()
                            .py(4),
                        "Id : ${Pictdata[index].id}".text.xl2.make().py(4),
                        "Title : ${Pictdata[index].title}"
                            .text
                            .xl2
                            .make()
                            .py(4),
                        "Url : ${Pictdata[index].url}".text.xl2.make().py(4),
                        "Thumbnail_Url : ${Pictdata[index].thumbnailUrl}"
                            .text
                            .xl2
                            .make()
                            .py(4),
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
