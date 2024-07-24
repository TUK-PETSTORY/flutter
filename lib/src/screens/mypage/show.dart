import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../../widgets/listitems/my_post_list_item.dart';

class MyPageShow extends StatefulWidget {
  @override
  _MyPageShowState createState() => _MyPageShowState();
}

class _MyPageShowState extends State<MyPageShow> {
  final AuthController authController = Get.find();
  Rx<List<Map>?> myPosts = Rx<List<Map>?>(null);

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  void _loadPosts() async {
    final postsData = await authController.getMyPosts();
    setState(() {
      myPosts.value = postsData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (myPosts.value == null) {
          return Center(child: CircularProgressIndicator());
        } else if (myPosts.value!.isEmpty) {
          return Center(child: Text('게시물이 없습니다.'));
        } else {
          return ListView.builder(
            itemCount: myPosts.value!.length,
            itemBuilder: (BuildContext context, int index) {
              final post = myPosts.value![index];
              return MyPostListItem(
                title: post['title'] ?? '제목 없음',
                content: post['content'] ?? '내용 없음',
                imgUrl: post['imgUrl'] ?? 'https://postfiles.pstatic.net/MjAyMjA2MjRfMjMx/MDAxNjU2MDMyMDQyMDQx.1ObmwoCe0in6YyV-I9VNP_i64QywoKxrBYlOFjt4Fd0g.-hgPSASB3oMtHfL9_46yYTCCtuRtNokwpPfIgxmQnMcg.JPEG.jobobo12/IMG_3973.JPG?type=w773',
                category: post['category'] ?? '기타',
              );
            },
          );
        }
      }),
    );
  }
}
