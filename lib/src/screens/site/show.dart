import 'package:flutter/material.dart';
import 'package:front/src/controllers/like_controller.dart';
import 'package:get/get.dart';
import 'package:front/src/controllers/site_controller.dart';
import '../../../widgets/listitems/site_list_item.dart';

class ShopShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SiteController siteController = Get.put(SiteController());
    final LikeController likeController = Get.put(LikeController());

    return Obx(() {
      if (siteController.sites.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          itemCount: siteController.sites.length,
          itemBuilder: (BuildContext context, int index) {
            var site = siteController.sites[index];
            return ShopListItem(
              siteId: site['id'],
              siteName: site['site_name'],
              siteUrl: site['site_url'],
              imageUrl: site['img_url'],
              content: site['content'],
              likes: site['likes'] ?? 0, // 좋아요 수를 사용합니다.
            );
          },
        );
      }
    });
  }
}
