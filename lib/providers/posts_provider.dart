import 'package:flutter/material.dart';
import 'package:provider_starter_app/models/post.dart';
import 'package:provider_starter_app/network/response.dart';
import 'package:provider_starter_app/services/api_service.dart';

class PostsProvider extends ChangeNotifier {
  final ApiService _apiService;
  NetworkResponse<List<PostModel>> postsListResponse = NetworkResponse.none();
  NetworkResponse publishPostResponse = NetworkResponse.none();

  PostsProvider(this._apiService);

  Future<void> fetchPosts() async {
    postsListResponse = NetworkResponse<List<PostModel>>.loading('Fetching posts...');
    notifyListeners();
    try {
      final postList = await _apiService.fetchPostsData();
      postsListResponse = NetworkResponse.completed(postList);
    } catch (e) {
      postsListResponse = NetworkResponse.error(e.toString());
      print('fetchPosts error: $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> publishPost(String title, String body, int userId) async {
    publishPostResponse = NetworkResponse.loading('Publishing post...');
    notifyListeners();
    try {
      final postList = await _apiService.publishPostData(body);
      publishPostResponse = NetworkResponse.completed(postList);
    } catch (e) {
      publishPostResponse = NetworkResponse.error(e.toString());
      print('publishPost error: $e');
    } finally {
      notifyListeners();
    }
  }
}
