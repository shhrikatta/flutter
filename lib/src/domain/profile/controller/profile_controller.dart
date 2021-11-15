import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/profile/model/profile_model.dart';
import 'package:globant_quiz/src/domain/profile/network/profile_api_provider.dart';

class ProfileController extends GetxController {
  final _profileApiProvider = ProfileApiProvider();
  // profile name observer
  RxString profileName = 'Shri Charan'.obs;
  // profile image observer
  RxString profileImg =
      'https://lh3.googleusercontent.com/a-/AOh14GhQg5BjvEeKF__aq6ORMmy0seIrv3MXEG2AgT-by5M=s96-c-rg-br100'
          .obs;
  // show loader while fetching info from api
  RxBool showLoader = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    showLoader(true);
    ProfileModel? _profile = await _profileApiProvider.fetchProfileApi();
    showLoader(false);
    final _fullName = '${_profile?.firstName} ${_profile?.lastName}';
    profileName(_fullName);
    profileImg(_profile?.profileImage);
  }
}
