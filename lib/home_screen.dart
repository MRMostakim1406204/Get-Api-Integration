import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_integration/Models/PostModel.dart';
import 'package:get_api_integration/details_listTile.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> postsList = [];

  Future<List<PostModel>> fetchData() async {
    final urlParse = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final response = await http.get(urlParse);

    if (response.statusCode == 200) {
      print("--------Success--------");

      var datas = jsonDecode(response.body.toString());

      for (var mm in datas) {
        postsList.add(PostModel.fromJson(mm));
      }
      return postsList;
    } else {
      print("-----Failed------");
      return postsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Get Api Call"),
        ),
        body: FutureBuilder(
          future: fetchData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: postsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsListTile(
                                  name: postsList[index].name,
                                      userId: postsList[index].id.toString(),
                                    )));
                      },
                      title: Text(postsList[index].name),
                      subtitle: Text(postsList[index].username),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
