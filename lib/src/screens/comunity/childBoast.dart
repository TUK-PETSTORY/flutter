import 'package:flutter/material.dart';
import '../../../widgets/listitems/feed_list_item.dart';

class Childboast extends StatefulWidget {
  @override
  _ChildboastState createState() => _ChildboastState();
}

class _ChildboastState extends State<Childboast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return FeedListItem(
            userName: '짱구에요',
            userProfileUrl:
                'https://postfiles.pstatic.net/MjAyMzEyMTlfMjgy/MDAxNzAyOTg5NjgwMjc0.ziM23298CkZAwkSmVK2ZKkeH5xyqT8CFk49MHY_gjCIg.MM-hcBk132gn7P-7kWzaFbYq5mfXRtauqKusNivCz2Qg.JPEG.tngus74m/Bazaart%EF%BC%BF20231219%EF%BC%BF125413%EF%BC%BF196.jpeg?type=w966',
            subtitle: '흰둥이 3살',
            imageUrl:
                'https://postfiles.pstatic.net/MjAyMjA2MjRfMjMx/MDAxNjU2MDMyMDQyMDQx.1ObmwoCe0in6YyV-I9VNP_i64QywoKxrBYlOFjt4Fd0g.-hgPSASB3oMtHfL9_46yYTCCtuRtNokwpPfIgxmQnMcg.JPEG.jobobo12/IMG_3973.JPG?type=w773',
            title: '밥먹고 낮잠자는 흰둥이',
            content:
                ' 흰둥이가 밥 먹고 낮잠을 자고있어요. 밥을 좀 많이 줬다고 생각했는데 다 먹고 자네요. 배가 동글동글한거 보니까 만족스러운 식사였나봐요.',
            date: '2024년 7월 20일',
            likes: 12,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
        backgroundColor: Color(0xFFFF4081), // 배경색
        foregroundColor: Colors.white, // 아이콘 색
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
