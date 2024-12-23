import 'package:api_learn_taj_1/GET/api_without_model.dart';
import 'package:api_learn_taj_1/GET/photos_api.dart';
import 'package:api_learn_taj_1/GET/posts_api.dart';
import 'package:api_learn_taj_1/GET/users_data_api.dart';
import 'package:api_learn_taj_1/POST/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Integration'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('GET API'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    color: Colors.blue,
                    elevation: 8,
                    child: Center(
                      child: Text(
                        "Post Api",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhotosApi(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    color: Colors.deepPurpleAccent,
                    elevation: 8,
                    child: Center(
                      child: Text(
                        "Photos Api",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsersDataApi(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    color: Colors.deepOrange,
                    elevation: 8,
                    child: Center(
                      child: Text(
                        "Users Data Api",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApiWithoutModel(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    color: Colors.lightGreen,
                    elevation: 8,
                    child: Center(
                      child: Text(
                        "Users Data Api Without Model",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Text('POST API'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signup(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    color: Colors.pinkAccent,
                    elevation: 8,
                    child: Center(
                      child: Text(
                        "SignUp With Api",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
