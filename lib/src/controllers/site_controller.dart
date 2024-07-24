import 'package:front/src/providers/site_provider.dart';
import 'package:get/get.dart';
import 'dart:developer';

class SiteController extends GetxController {
  final siteProvider = Get.put(SiteProvider());
  var sites = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSites();
  }

  Future<void> fetchSites() async {
    Map body = await siteProvider.shopShowAll();
    if (body['success'] == true) {
      List siteList = body['sites'];
      
      List<Map> sitesWithLikes = await Future.wait(siteList.map<Future<Map>>((site) async {
        Map likesBody = await siteProvider.getLikesCountBySiteId(site['id']);
        int likesCount = likesBody['success'] ? (likesBody['count'] ?? 0) : 0;
        return {
          ...site,
          'likes': likesCount,
        };
      }).toList());

      sites.value = sitesWithLikes;
      log("Sites: ${sites.length}");
    } else {
      Get.snackbar("유저 정보 에러", body['message'],
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
