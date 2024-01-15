import 'package:buzzworks_test/api/api.dart';

class Repo {
  Future fetchPosts() async {
    return await ApiHelper.get("/posts");
  }
}
