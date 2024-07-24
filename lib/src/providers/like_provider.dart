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

  Future<Map> countLikesByPostId(int postId) async {
    final response = await get('/like/count/post/$postId');
    return response.body;
  }

  Future<Map> countLikesBySiteId(int siteId) async {
    final response = await get('/like/count/site/$siteId');
    return response.body;
  }
}
