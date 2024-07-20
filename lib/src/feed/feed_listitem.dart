import 'package:flutter/material.dart';

class FeedListItem extends StatefulWidget {
  @override
  _FeedListItemState createState() => _FeedListItemState();
}

class _FeedListItemState extends State<FeedListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1)), //경계선 추가
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              children: [
                CircleAvatar(
                  //유저 프로필
                  radius: 22,
                  backgroundImage: NetworkImage(
                      'https://postfiles.pstatic.net/MjAyMzEyMTlfMjgy/MDAxNzAyOTg5NjgwMjc0.ziM23298CkZAwkSmVK2ZKkeH5xyqT8CFk49MHY_gjCIg.MM-hcBk132gn7P-7kWzaFbYq5mfXRtauqKusNivCz2Qg.JPEG.tngus74m/Bazaart%EF%BC%BF20231219%EF%BC%BF125413%EF%BC%BF196.jpeg?type=w966'),
                ),
                SizedBox(width: 8), //요소 사이 간격
                Expanded(
                  //사용자 이름, 아이콘 가로 정렬
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '짱구에요',
                            style: TextStyle(
                                fontFamily: 'MainFont',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Icon(Icons.more_horiz,
                              size: 20, color: Colors.grey), //더보기 아이콘
                        ],
                      ),
                      Text(
                        '흰둥이 3살',
                        style: TextStyle(
                            fontFamily: 'MainFont',
                            color: Colors.grey[600],
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5), //요소 사이 간격
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10), //사진 여백
            child: Image.network(
              'https://postfiles.pstatic.net/MjAyMjA2MjRfMjMx/MDAxNjU2MDMyMDQyMDQx.1ObmwoCe0in6YyV-I9VNP_i64QywoKxrBYlOFjt4Fd0g.-hgPSASB3oMtHfL9_46yYTCCtuRtNokwpPfIgxmQnMcg.JPEG.jobobo12/IMG_3973.JPG?type=w773',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4), //요소 사이 간격
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //제목
                  '밥먹고 낮잠자는 흰둥이',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MainFont',
                      color: Colors.black87),
                ),
                SizedBox(height: 4), //요소 사이 간격
                Text(
                  //내용
                  ' 흰둥이가 밥 먹고 낮잠을 자고있어요. 밥을 좀 많이 줬다고 생각했는데 다 먹고 자네요. 배가 동글동글한거 보니까 만족스러운 식사였나봐요.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'MainFont',
                  ),
                ),
                SizedBox(height: 4), //요소 사이 간격
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2024년 7월 20일',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'MainFont',
                      ),
                    ), //작성날짜
                    Row(
                      //좋아요 아이콘
                      children: [
                        Icon(Icons.thumb_up_off_alt),
                        SizedBox(width: 4), //요소사이 간격
                        Text(
                          '12',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
