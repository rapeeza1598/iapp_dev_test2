part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostLoadingState extends PostState {
  @override
  String toString() => 'PostLoading';
}

class PostErrorState extends PostState {
  final String message;
  PostErrorState(this.message);
}
