import 'package:provider_starter_app/models/post.dart';
import 'package:provider_starter_app/network/api_service.dart';

class ApiServiceRepository {
  ApiService _apiService;

  ApiServiceRepository(String baseApiUrl) {
    _apiService = ApiService(baseApiUrl: baseApiUrl);
  }

  Future<List<Post>> fetchPostsData() async {
    final response = await _apiService.get(ApiService.postsPath);
    return response
        .map((postData) => Post.fromJson(postData as Map<String, dynamic>))
        .toList();
  }

  Future<Post> publishPostData(String jsonBody) async {
    final response = await _apiService.post(ApiService.postsPath, jsonBody);
    return Post.fromJson(response);
  }
}
