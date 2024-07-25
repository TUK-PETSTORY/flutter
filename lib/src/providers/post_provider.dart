import 'dart:developer';

import '../providers/provider.dart';

class PostProvider extends Provider {
  Future<Map> postWrite(String title, String content, int fileId, String imgUrl,
      int userId, String category, String petName, int petAge) async {
    final response = await post('/post/write', {
      "title": title,
      "content": content,
      "fileId": fileId,
      "imgUrl": imgUrl,
      "userId": userId,
      "category": category,
      "petName": petName,
      "petAge": petAge
    });
    log("Post Write API Response: ${response.body.toString()}");
    if (response.status.hasError) {
      log("Post Write API Error: ${response.statusText}");
      throw Exception('API 호출 실패: ${response.statusText}');
    }
    return response.body;
  }

  Future<Map> postGet(String category) async {
    final response = await get('/post/$category');
    log("Post Get API Response: ${response.body.toString()}");
    if (response.status.hasError) {
      log("Post Get API Error: ${response.statusText}");
      throw Exception('API 호출 실패: ${response.statusText}');
    }
    return response.body;
  }

  Future<Map> postUpdate(
      int id,
      String title,
      String content,
      int fileId,
      String imgUrl,
      int userId,
      String category,
      String petName,
      int petAge) async {
    final response = await put('/post/$id', {
      "title": title,
      "content": content,
      "fileId": fileId,
      "imgUrl": imgUrl,
      "userId": userId,
      "category": category,
      "petName": petName,
      "petAge": petAge
    });
    log("Post Update API Response: ${response.body.toString()}");
    if (response.status.hasError) {
      log("Post Update API Error: ${response.statusText}");
      throw Exception('API 호출 실패: ${response.statusText}');
    }
    return response.body;
  }

  Future<Map> postDelete(int id) async {
    final response = await delete('/post/$id');
    log("Post Delete API Response: ${response.body.toString()}");
    if (response.status.hasError) {
      log("Post Delete API Error: ${response.statusText}");
      throw Exception('API 호출 실패: ${response.statusText}');
    }
    return response.body;
  }

  Future<Map<String, dynamic>> fetchUserPosts() async {
    final response = await get('/user/posts');
    log("Fetch User Posts API Response: ${response.body.toString()}");
    if (response.status.hasError) {
      log("Fetch User Posts API Error: ${response.statusText}");
      throw Exception('API 호출 실패: ${response.statusText}');
    }
    return response.body;
  }
}
