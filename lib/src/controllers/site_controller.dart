import 'package:front/src/providers/site_provider.dart';
import 'package:get/get.dart';

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
      sites.value = siteList;
    }
  }
}
