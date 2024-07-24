import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/post_controller.dart';
import '../../../widgets/listitems/my_post_list_item.dart';

class MyPageShow extends StatefulWidget {
  @override
  _MyPageShowState createState() => _MyPageShowState();
}

class _MyPageShowState extends State<MyPageShow> {
  final PostController postController = Get.put(PostController());

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  void _loadPosts() async {
    await postController.fetchUserPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (postController.postList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (postController.postList.isEmpty) {
          return Center(child: Text('게시물이 없습니다.'));
        } else {
          return ListView.builder(
            itemCount: postController.postList.length,
            itemBuilder: (BuildContext context, int index) {
              final post = postController.postList[index];
              return MyPostListItem(
                title: post['title'] ?? '제목 없음',
                content: post['content'] ?? '내용 없음',
                imgUrl: post['imgUrl']?.isNotEmpty == true
                    ? post['imgUrl']
                    : 'https://postfiles.pstatic.net/MjAyMjA2MjRfMjMx/MDAxNjU2MDMyMDQyMDQx.1ObmwoCe0in6YyV-I9VNP_i64QywoKxrBYlOFjt4Fd0g.-hgPSASB3oMtHfL9_46yYTCCtuRtNokwpPfIgxmQnMcg.JPEG.jobobo12/IMG_3973.JPG?type=w773',
                category: post['category'] ?? '기타',
              );
            },
          );
        }
      }),
    );
  }
}
