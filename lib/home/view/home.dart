import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeBloc();
  @override
  void initState() {
    _homeBloc.fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.postList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.postList[index].title ?? ""),
                          subtitle: Text(state.postList[index].body ?? ""),
                        );
                      }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
