import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/profile/model/profile_model.dart';
import 'package:globant_quiz/src/helpers/constants.dart';

class ProfileApiProvider extends GetConnect {
  Future<ProfileModel?> fetchProfileApi() async {
    final resp = await get('$BASE_URL/profile');

    if (resp.statusCode == 200) {
      final _profileResp = resp.body as List;
      return ProfileModel.fromJson(_profileResp.first);
    }
  }
}
