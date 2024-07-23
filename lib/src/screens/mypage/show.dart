import 'package:flutter/material.dart';
import '../../../widgets/listitems/my_post_list_item.dart';

class MyPageShow extends StatefulWidget {
  @override
  _MyPageShowState createState() => _MyPageShowState();
}

class _MyPageShowState extends State<MyPageShow> {
  final List<Map<String, String>> myPosts = [
    {'title': '첫 번째 글', 'content': '어쩌구저쩌구저쩌구어쩌구어쩌구저쩌구쏼랴쏼랴쒜킷쒜킷붐붐붐부루부루붐', 'category': '자식자랑'},
    {'title': '두 번째 글', 'content': '내용 2', 'category': '육아꿀팁'},
    {'title': '세 번째 글', 'content': '내용 3', 'category': '자식자랑'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: myPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return MyPostListItem(
            title: myPosts[index]['title'] ?? '제목 없음',
            content: myPosts[index]['content'] ?? '내용 없음',
            imageUrl:
                'https://postfiles.pstatic.net/MjAyMjA2MjRfMjMx/MDAxNjU2MDMyMDQyMDQx.1ObmwoCe0in6YyV-I9VNP_i64QywoKxrBYlOFjt4Fd0g.-hgPSASB3oMtHfL9_46yYTCCtuRtNokwpPfIgxmQnMcg.JPEG.jobobo12/IMG_3973.JPG?type=w773',
            category: myPosts[index]['category'] ?? '기타',
          );
        },
      ),
    );
  }
}
