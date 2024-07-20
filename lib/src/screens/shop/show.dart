import 'package:flutter/material.dart';

class ShopListItem extends StatefulWidget {
  @override
  _ShopListItemState createState() => _ShopListItemState();
}

class _ShopListItemState extends State<ShopListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 사이트 이름과 바로가기 텍스트
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PETHROOM',
                style: TextStyle(
                  fontFamily: 'MainFont',
                  fontSize: 24,
                ),
              ),
              Text(
                '바로가기 >',
                style: TextStyle(
                  fontFamily: 'MainFont',
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // 이미지와 설명
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://postfiles.pstatic.net/MjAyMjA2MjRfMjMx/MDAxNjU2MDMyMDQyMDQx.1ObmwoCe0in6YyV-I9VNP_i64QywoKxrBYlOFjt4Fd0g.-hgPSASB3oMtHfL9_46yYTCCtuRtNokwpPfIgxmQnMcg.JPEG.jobobo12/IMG_3973.JPG?type=w773',
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 150, // Image의 높이와 동일하게 설정
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '반려동물을 위한 프리미엄 라이프 스타일 브랜드 PETHROOM!',
                        style: TextStyle(fontFamily: 'MainFont', fontSize: 18),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.favorite_border, size: 18),
                            SizedBox(width: 4),
                            Text(
                              '12',
                              style: TextStyle(
                                  fontFamily: 'MainFont', fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // 구분선 추가
          SizedBox(height: 10),
          Divider(color: Colors.grey[300], thickness: 1),
        ],
      ),
    );
  }
}
