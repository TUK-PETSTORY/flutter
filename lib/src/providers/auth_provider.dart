import '../providers/provider.dart';

class AuthProvider extends Provider {
  Future<Map> userJoin(String accountId, String password, String name) async {
    final response = await post('/user/join',
        {'accountId': accountId, "password": password, "name": name});
    return response.body;
  }

  Future<Map> userLogin(String accountId, String password) async {
    final response = await post(
        '/user/login', {"accountId": accountId, "password": password});
    return response.body;
  }

  Future<Map> userShow() async {
    final response = await get('/user/show');
    return response.body;
  }
}
