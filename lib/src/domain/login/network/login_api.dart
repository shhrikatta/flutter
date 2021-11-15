import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/login/network/models/login_resp_model.dart';
import 'package:globant_quiz/src/helpers/constants.dart';

class LoginNetwork extends GetConnect {
  Future<bool> fetchLoginApi(Map data) async {
    final resp = await post('$BASE_URL/signin', data);

    if (resp.statusCode == 200) {
      final loginResp = LoginRespModel.fromJson(resp.body);
      return loginResp.status?.toLowerCase() == 'success' ? true : false;
    } else {
      return false;
    }
  }
}
