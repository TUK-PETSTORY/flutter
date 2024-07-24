import 'package:flutter/material.dart';
import '../../../widgets/listitems/feed_list_item.dart';

class ChildcareTips extends StatefulWidget {
  @override
  _ChildcareTipsState createState() => _ChildcareTipsState();
}

class _ChildcareTipsState extends State<ChildcareTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return FeedListItem(
            category: '육아꿀팁',
            userId: 1,
            userName: '신짱구',
            userProfileUrl:
                'https://postfiles.pstatic.net/MjAyMDEyMTRfNiAg/MDAxNjA3ODcyODQ0NDg0.ncVxS5toogcj27QiffiL2WsPC6wPcwQrkkjIwSmxXyYg.iHmd_7gpwbIKVN_9lw876SnwK1ySGlO1Ii5QskBEHDsg.JPEG.sosohan_n/2_(5).jpg?type=w2000',
            childName: "흰둥이",
            childAge: 4,
            imageUrl:
                'https://postfiles.pstatic.net/MjAyMDEyMTRfMjEy/MDAxNjA3ODcyNDUzNTc4.MRysg8AHZIQFYzmgE83T9TKayvmBM7GrxjJQ7QSdPYEg.rFJiYxyhmNqaLKZCI5wDYCJsF8pco5mNhnDEzLuED40g.JPEG.sosohan_n/24_(12).jpg?type=w773',
            title: '양치하는 흰둥이',
            content: '흰둥이가 스스로 양치하는 법을 배웠어요!',
            date: '2024년 8월 20일',
            postId: 1,
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
