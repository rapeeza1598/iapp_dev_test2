import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_dev_test2/bloc/post_bloc.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(GetPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostLoadingState) {
          isLoading();
        } else if (state is GetPostsStateSuccess) {
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
                  itemCount: state.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.blueGrey,
                      child: ListTile(
                        leading: CircleAvatar(
                          // random color
                          backgroundColor: Color(
                                  (Random().nextInt(1000000) * 0xFFFFFF)
                                      .toInt())
                              .withOpacity(1.0),
                          child: Text(state.posts[index].title[0].toUpperCase()),
                        ),
                        title: Text(state.posts[index].title,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is PostErrorState) {
          return Scaffold(
            body: Center(
              child: Text(state.message),
            ),
          );
        }
        // return state is PostLoading ? isLoading() : loadingSuccess();
        return isLoading();
      },
      listener: (context, state) {
        if (state is PostErrorState) {
          print(state);
        }
      },
    );
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
}
