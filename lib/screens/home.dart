import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return loadingSuccess();
  }

  isLoading() {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ))),
    );
  }

  loadingSuccess() {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo[900],
        ),
        body: Container(
          color: Colors.indigo[900],
          child: Padding(
            padding: EdgeInsets.all(5),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.blueGrey,
                    child: ListTile(
                      leading: CircleAvatar(
                        // random color
                        backgroundColor: Color((Random().nextInt(1000000) * 0xFFFFFF).toInt()).withOpacity(1.0),
                        child: Text('$index'),
                      ),
                      title: Text('รายการที่ $index',style: const TextStyle(color: Colors.white)),
                      subtitle: Text('รายละเอียดที่ $index',style: const TextStyle(color: Colors.white)),
                    ),
                  );
                },
              ),
            ),
        ),
        );
  }
}
