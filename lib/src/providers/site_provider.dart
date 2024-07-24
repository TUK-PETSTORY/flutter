import 'package:front/src/providers/provider.dart';

class SiteProvider extends Provider {
  Future<Map> shopShowAll() async {
    final response = await get('/site/all');
    return response.body;
  }

  Future<Map> getLikesCountBySiteId(int siteId) async {
    final response = await get('/like/count/site/$siteId');
    return response.body;
  }
}
