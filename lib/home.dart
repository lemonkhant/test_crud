import 'package:flutter/material.dart';
import 'package:test_app/create.dart';
import 'package:test_app/delete.dart';
import 'package:test_app/fetch.dart';
import 'package:test_app/update.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 140),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreateData(),
                    ),
                  );
                },
                child: Text("CREATE")),
            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> const FetchData()));
            }, child: Text("READ")),
            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> const UpdateScreen()));
            }, child: Text("UPDATE")),
            ElevatedButton(onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder: (context)=> const Deletecreen()));
            }, child: Text("DELETE")),
          ],
        ),
      ),
    );
  }
}
