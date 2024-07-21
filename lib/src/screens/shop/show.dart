import 'package:flutter/material.dart';
import '../../../widgets/listitems/site_list_item.dart';

class ShopShow extends StatefulWidget {
  @override
  _ShopListItemState createState() => _ShopListItemState();
}

class _ShopListItemState extends State<ShopShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ShopListItem(
            siteName: 'PETHROOM',
            siteUrl: 'https://pethroom.com',
            imageUrl:
                'https://yt3.googleusercontent.com/ytc/AIdro_kbggBDMlka5N8AcWl0p-StiPEaK6WY14wVd7HEPK1LXNc=s900-c-k-c0x00ffffff-no-rj',
            content: '반려동물을 위한 프리미엄 라이프 스타일 브랜드 PETHROOM!',
            likes: 12,
          );
        },
      ),
    );
  }
}
