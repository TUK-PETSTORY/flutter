import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopListItem extends StatefulWidget {
  final String siteName;
  final String siteUrl;
  final String imageUrl;
  final String content;
  final int likes;

  ShopListItem({
    required this.siteName,
    required this.siteUrl,
    required this.imageUrl,
    required this.content,
    required this.likes,
  });

  @override
  _ShopListItemState createState() => _ShopListItemState();
}

class _ShopListItemState extends State<ShopListItem> {
  bool _isLiked = false;
  late int _likes;

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _isLiked ? _likes++ : _likes--;
    });
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(widget.siteUrl);
    print('url: ${url}');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // 웹에서는 브라우저에서 열도록 설정
    )) {
      throw 'Could not launch $url';
    }
  }

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
                widget.siteName,
                style: TextStyle(
                  fontFamily: 'MainFont',
                  fontSize: 24,
                ),
              ),
              TextButton(
                onPressed: _launchURL,
                child: Text(
                  '바로가기 >',
                  style: TextStyle(
                    fontFamily: 'MainFont',
                    fontSize: 18,
                  ),
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
                widget.imageUrl,
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
                        widget.content,
                        style: TextStyle(fontFamily: 'MainFont', fontSize: 18),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                _isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 18,
                              ),
                              onPressed: _toggleLike,
                            ),
                            Text(
                              '${widget.likes}',
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
