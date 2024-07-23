import 'package:flutter/material.dart';
import 'show.dart';

class MyPageIndex extends StatelessWidget {
  const MyPageIndex({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면의 가로 크기를 가져옴
    double screenWidth = MediaQuery.of(context).size.width;

    // 화면 크기의 비율에 따라 반지름을 설정
    double circleRadius = screenWidth * 0.1; // 15% 크기로 설정

    // AppBar의 bottom 부분 높이를 계산
    double bottomHeight = circleRadius * 2 + 60; // 이미지 높이 + 여백

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Pet Story', style: TextStyle(fontFamily: 'MainFont')),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(bottomHeight),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // 프로필 사진
                    CircleAvatar(
                      radius: circleRadius, // 동적으로 계산된 반지름 사용
                      backgroundImage: NetworkImage(
                        'https://postfiles.pstatic.net/MjAyMjA2MjRfMjMx/MDAxNjU2MDMyMDQyMDQx.1ObmwoCe0in6YyV-I9VNP_i64QywoKxrBYlOFjt4Fd0g.-hgPSASB3oMtHfL9_46yYTCCtuRtNokwpPfIgxmQnMcg.JPEG.jobobo12/IMG_3973.JPG?type=w773',
                      ),
                    ),
                    SizedBox(width: 20),
                    // 사용자 이름
                    Text(
                      '나는 희연',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'MainFont',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    '내가 쓴 글',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MainFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 1.0,
                  color: Colors.grey.shade300,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
      body: MyPageShow(),
    );
  }
}
