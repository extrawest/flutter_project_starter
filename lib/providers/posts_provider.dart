import 'package:flutter/material.dart';
import 'package:provider_starter_app/models/post.dart';
import 'package:provider_starter_app/network/response.dart';
import 'package:provider_starter_app/repositories/api_service_repository.dart';

class PostsProvider extends ChangeNotifier {
  ApiServiceRepository _apiServiceRepository;
  Response<List<Post>> postsListResponse = Response.none();
  Response publishPostResponse = Response.none();

  PostsProvider(String baseApiUrl) {
    _apiServiceRepository = ApiServiceRepository(baseApiUrl);
  }

  Future<void> fetchPosts() async {
    postsListResponse = Response<List<Post>>.loading("Fetching posts...");
    notifyListeners();
    try {
      final postList = await _apiServiceRepository.fetchPostsData();
      postsListResponse = Response.completed(postList);
      notifyListeners();
    } catch (e) {
      postsListResponse = Response.error(e.toString());
      notifyListeners();
      print(e);
    }
  }

  Future<void> publishPost(String title, String body, int userId) async {
    publishPostResponse = Response.loading("Publishing post...");
    notifyListeners();
    try {
      final postList = await _apiServiceRepository.publishPostData(body);
      publishPostResponse = Response.completed(postList);
      notifyListeners();
    } catch (e) {
      publishPostResponse = Response.error(e.toString());
      notifyListeners();
      print(e);
    }
  }
}
