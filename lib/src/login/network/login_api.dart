import 'dart:convert';

import 'package:get/get.dart';
import 'package:globant_quiz/src/login/network/models/login_resp_model.dart';

class LoginNetwork extends GetConnect {
  Future<bool> fetchLoginApi(Map data) async {
    final Response<LoginRespModel> resp = await post(
        'http://nopb700dxu00.tat.corp.globant.com/api/v1/signin',
        jsonEncode(data));

    if (resp.statusCode == 200 &&
        resp.body?.status?.toLowerCase() == 'success') {
      return true;
    } else {
      return false;
    }
  }
}
