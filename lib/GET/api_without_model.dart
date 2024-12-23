import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiWithoutModel extends StatefulWidget {
  const ApiWithoutModel({super.key});

  @override
  State<ApiWithoutModel> createState() => _ApiWithoutModelState();
}

class _ApiWithoutModelState extends State<ApiWithoutModel> {
  var data;

  Future<void> getUserApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
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
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Column(
                    children: [
                      Center(child: Text("Loading...")),
                      RefreshProgressIndicator(),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            spacing: 5,
                            children: [
                              ReusableRow(
                                title: 'Name',
                                value: data[index]['name'].toString(),
                              ),
                              ReusableRow(
                                title: 'Email',
                                value: data[index]['email'].toString(),
                              ),
                              ReusableRow(
                                title: 'City',
                                value:
                                    data[index]['address']['city'].toString(),
                              ),
                            ],
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

// ignore: must_be_immutable
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
