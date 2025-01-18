import 'dart:convert';

import 'package:api_learn_taj_1/Model/users_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersDataApi extends StatefulWidget {
  const UsersDataApi({super.key});

  @override
  State<UsersDataApi> createState() => _UsersDataApiState();
}

class _UsersDataApiState extends State<UsersDataApi> {
  List<UserModel> userslist = [];
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userslist.add(UserModel.fromJson(i));
      }
      return userslist;
    } else {
      return userslist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Data Api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      LinearProgressIndicator(),
                      Center(child: Text("Loading...")),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: userslist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              spacing: 5,
                              children: [
                                ReusableRow(
                                    title: "Name",
                                    value:
                                        snapshot.data![index].name.toString()),
                                ReusableRow(
                                    title: "User Name",
                                    value: snapshot.data![index].username
                                        .toString()),
                                ReusableRow(
                                    title: "Email",
                                    value:
                                        snapshot.data![index].email.toString()),
                                ReusableRow(
                                    title: "City",
                                    value: snapshot.data![index].address!.city
                                        .toString()),
                                ReusableRow(
                                    title: "Phone",
                                    value:
                                        snapshot.data![index].phone.toString()),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  ReusableRow({super.key, required this.title, required this.value});
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
