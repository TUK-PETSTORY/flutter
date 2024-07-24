import 'package:front/src/providers/provider.dart';

class LikeProvider extends Provider {
  Future<Map> saveLike(int userId, int postId, int siteId) async {
    final response = await post('/like', {
      'userId': userId,
      'postId': postId,
      'siteId': siteId,
    });
    return response.body;
  }

  Future<Map> deleteLike(int likeId) async {
    final response = await delete('/like/$likeId');
    return response.body;
  }
}
