import 'package:buzzworks_test/home/model/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repo.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState());

  final _repo = Repo();

  Future<void> fetchPosts() async {
    try {
      List<Posts> postList = [];
      var data = await _repo.fetchPosts();
      if (data != null) {
        for (var post in data) {
          postList.add(Posts.fromJson(post));
        }
        emit(state.copyWith(postList: postList));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
