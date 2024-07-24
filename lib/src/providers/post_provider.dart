import '../providers/provider.dart';

class PostProvider extends Provider {
  Future<Map> postWrite(String title, String content, int fileId, String imgId,
      int userId, String category, String petName, int petAge) async {
    final response = await post('/post/write', {
      "title": title,
      "content": content,
      "file_id": fileId,
      "image_id": imgId,
      "user_id": userId,
      "category": category,
      "pet_name": petName,
      "pet_age": petAge
    });
    return response.body;
  }

  Future<Map> postGet(String category) async {
    final response = await get('/post/category/$category');
    if (response.status.hasError) {
      throw Exception('API 호출 실패: ${response.statusText}');
    }
    return response.body;
  }

  Future<Map> postUpdate(
      int id,
      String title,
      String content,
      int fileId,
      String imgId,
      int userId,
      String category,
      String petName,
      int petAge) async {
    final response = await put('/post/$id', {
      "title": title,
      "content": content,
      "file_id": fileId,
      "image_id": imgId,
      "user_id": userId,
      "category": category,
      "pet_name": petName,
      "pet_age": petAge
    });
    return response.body;
  }

  Future<Map> postDelete(int id) async {
    final response = await delete('/post/$id');
    return response.body;
  }
}
