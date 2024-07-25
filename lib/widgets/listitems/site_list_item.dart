import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:front/src/controllers/like_controller.dart';

class ShopListItem extends StatefulWidget {
  final String siteName;
  final String siteUrl;
  final String imageUrl;
  final String content;
  final int siteId;
  final bool isLiked;

  ShopListItem(
      {required this.siteName,
      required this.siteUrl,
      required this.imageUrl,
      required this.content,
      required this.siteId,
      required this.isLiked});

  @override
  _ShopListItemState createState() => _ShopListItemState();
}

class _ShopListItemState extends State<ShopListItem> {
  bool _isLiked = false;
  final LikeController likeController = Get.put(LikeController());

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  void _toggleLike() async {
    setState(() {
      _isLiked = !_isLiked;
    });

    if (_isLiked) {
      // 즐겨찾기 등록
      await likeController.saveLike(
          3, 0, widget.siteId); // 예시 userId와 postId를 사용
    } else {
      // 즐겨찾기 삭제
      await likeController.deleteLike(5); // 예시 userId를 사용
    }
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(widget.siteUrl);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
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
                  height: 150,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.grey[300], thickness: 1),
        ],
      ),
    );
  }
}
