import 'package:front/src/providers/provider.dart';

class SiteProvider extends Provider {
  Future<Map> shopShowAll() async {
    final response = await get('/site/all');
    return response.body;
  }
}
