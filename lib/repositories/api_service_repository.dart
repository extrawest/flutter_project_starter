import 'package:provider_starter_app/models/post.dart';
import 'package:provider_starter_app/network/api_service.dart';

class ApiServiceRepository {
  ApiService _apiService;

  ApiServiceRepository(String baseApiUrl) {
    _apiService = ApiService(baseApiUrl: baseApiUrl);
  }

  Future<List<Post>> fetchPostsData() async {
    final response = await _apiService.get(ApiService.POSTS_PATH);
    return response.map<Post>((postData) => Post.fromJson(postData)).toList();
  }

  Future<Post> publishPostData(String jsonBody) async {
    final response = await _apiService.post(ApiService.POSTS_PATH, jsonBody);
    return Post.fromJson(response);
  }
}