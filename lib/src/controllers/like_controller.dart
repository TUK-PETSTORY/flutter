import 'package:get/get.dart';
import 'package:front/src/providers/like_provider.dart';
import 'dart:developer';

class LikeController extends GetxController {
  final likeProvider = Get.put(LikeProvider());
  var likeCount = 0.obs;

  Future<void> saveLike(int userId, int postId, int siteId) async {
    Map body = await likeProvider.saveLike(userId, postId, siteId);
    if (body['success'] == true) {
      log("Like saved successfully");
    }
  }

  Future<void> deleteLike(int likeId) async {
    Map body = await likeProvider.deleteLike(likeId);
    if (body['success'] == true) {
      log("Like deleted successfully");
    }
  }
}
