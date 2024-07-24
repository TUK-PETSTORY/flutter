import 'package:get/get.dart';
import 'dart:developer';
import '../../src/providers/post_provider.dart';

class PostController extends GetxController {
  final postProvider = Get.put(PostProvider());
  var postList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var fetchPostsError = false.obs;

  Future<void> fetchPosts(String category) async {
  isLoading.value = true;
  try {
    // API 호출
    Map body = await postProvider.postGet(category);
    log("API Response: ${body.toString()}"); // 응답 로그 출력

    if (body['success'] == true) {
      // 응답에서 postDetailInfo 추출
      List<dynamic> posts = body['postDetailInfo'] ?? [];
      
      // 게시글 데이터를 Map으로 변환하여 리스트에 할당
      postList.value = posts.map((post) {
        return {
          'id': post['id'],
          'title': post['title'],
          'content': post['content'],
          'fileId': post['fileId'],
          'imgUrl': post['imgUrl'] ?? '', // 이미지 URL이 비어있을 경우 기본 이미지 URL 사용
          'userId': post['userId'],
          'category': post['category'],
          'petName': post['petName'],
          'petAge': post['petAge'],
          'createAt': post['createAt'],
          'user': {
            'name': post['user']['name'],
            'imgUrl': post['user']['imgUrl'] ?? 'https://postfiles.pstatic.net/MjAyMjA2MjRfMjMx/MDAxNjU2MDMyMDQyMDQx.1ObmwoCe0in6YyV-I9VNP_i64QywoKxrBYlOFjt4Fd0g.-hgPSASB3oMtHfL9_46yYTCCtuRtNokwpPfIgxmQnMcg.JPEG.jobobo12/IMG_3973.JPG?type=w773', // 사용자 이미지 URL이 비어있을 경우 기본 이미지 URL 사용
            'fileId': post['user']['fileId'] ?? 0, // 사용자 fileId가 null인 경우 기본값 설정
          },
        };
      }).toList();
      
      log("Post List: ${postList.toString()}");
    } else {
      Get.snackbar(
        "게시글 조회 에러", 
        body['message'] ?? "Unknown error",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } catch (e) {
    Get.snackbar(
      "게시글 조회 에러", 
      "데이터를 가져오는 데 실패했습니다.",
      snackPosition: SnackPosition.BOTTOM,
    );
    log("Error: $e"); // 예외 로그 출력
  } finally {
    isLoading.value = false;
  }
}


  Future<bool> postWrite(
      String title,
      String content,
      int fileId,
      String imgUrl,
      int userId,
      String category,
      String petName,
      int petAge) async {
    try {
      Map body = await postProvider.postWrite(
          title, content, fileId, imgUrl, userId, category, petName, petAge);
      log("Post Write Response: ${body.toString()}");

      if (body['success'] == true) {
        String message = body['message'];
        log("message:$message");
        fetchPosts(category);
        return true;
      } else {
        Get.snackbar('게시글 등록 에러', body['message'],
            snackPosition: SnackPosition.BOTTOM);
        return false;
      }
    } catch (e) {
      log("Error: $e");
      Get.snackbar('게시글 등록 에러', '데이터를 등록하는 데 실패했습니다.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  Future<Map?> postGet(String category) async {
    Map body = await postProvider.postGet(category);
    if (body['success'] == true) {
      return body;
    }
    Get.snackbar("게시글 조회 에러", body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return null;
  }

  Future<Map?> postUpdate(
      int id,
      String title,
      String content,
      int fileId,
      String imgUrl,
      int userId,
      String category,
      String petName,
      int petAge) async {
    Map body = await postProvider.postUpdate(
        id, title, content, fileId, imgUrl, userId, category, petName, petAge);
    if (body['success'] == true) {
      Map post = body['post'];
      log("Post: ${post.toString()}");
      fetchPosts(category);
      return post;
    }
    Get.snackbar("게시글 수정 에러", body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return null;
  }

  Future<bool> postDelete(int id) async {
    try {
      Map body = await postProvider.postDelete(id);
      log("Post Delete Response: ${body.toString()}"); // 응답 로그 출력
      if (body['success'] == true) {
        String message = body['message'];
        log("message: $message");
        return true;
      }
      Get.snackbar('게시글 삭제 에러', body['message'],
          snackPosition: SnackPosition.BOTTOM);
      return false;
    } catch (e) {
      log("Error: $e");
      Get.snackbar('게시글 삭제 에러', '데이터를 삭제하는 데 실패했습니다.',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  Future<void> fetchUserPosts() async {
    try {
      final Map<String, dynamic> body = await postProvider.fetchUserPosts();

      if (body['success'] == true) {
        List<Map<String, dynamic>> posts = List<Map<String, dynamic>>.from(body['userPosts']);
        postList.value = posts;
      } else {
        Get.snackbar("게시글 조회 에러", body['message'] ?? "Unknown error",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("게시글 조회 에러", "데이터를 가져오는 데 실패했습니다.",
          snackPosition: SnackPosition.BOTTOM);
      log("Error: $e"); // 예외 로그 출력
    }
  }
}
