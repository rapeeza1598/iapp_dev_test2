import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_dev_test2/screens/post_list.dart';

import 'bloc/post_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home',
        home: PostList()
      ),
    );
  }
}
