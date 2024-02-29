import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../model/posts.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetPostsEvent>(_onGetPosts);
  }
  void _onGetPosts(GetPostsEvent event, Emitter<PostState> emit) async {
      emit(PostLoadingState());

      final req = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (req.statusCode != 200) {
        emit(PostErrorState('Failed to load posts'));
        return;
      }
      
      final json = jsonDecode(req.body) as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();

      emit(GetPostsStateSuccess(posts: posts));
    }
}

class GetPostsEvent extends PostEvent {}

class GetPostsStateSuccess extends PostState {
  final List<Post> posts;
  GetPostsStateSuccess({required this.posts});
}
