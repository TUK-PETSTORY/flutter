import '../shared/Global.dart';
import 'package:get/get.dart';

class Provider extends GetConnect {
  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = 'http://localhost:3000';
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      if (!request.url.toString().contains('/login') || request.url.toString().contains('/join')) {
        request.headers['Authorization'] = 'Bearer ${Global.accessToken}';
      }
      return request;
    });
    super.onInit();
  }
}
