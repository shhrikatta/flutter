import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:globant_quiz/src/domain/login/network/login_api.dart';
import 'package:globant_quiz/src/domain/login/network/models/login_req_model.dart';
import 'package:globant_quiz/src/helpers/constants.dart';

class LoginController extends GetxController {
  // email validations
  final RxString _emailController = ''.obs;
  final RxString _emailError = ''.obs;
  // on Submit
  RxBool showLoader = false.obs;
  //API
  final LoginNetwork _loginNetwork = LoginNetwork();
  // is logged-in storage
  final _loggedInState = GetStorage();

  onEmailEntered(data) {
    _emailController(data);

    if (!_emailController.value.contains('@') ||
        !_emailController.value.endsWith('.com')) {
      _emailError('Invalid Email Id');
    } else {
      _emailError.value = '';
    }
  }

  get onEmailError {
    if (_emailError.value.isNotEmpty) {
      return _emailError.value;
    }
  }

  // password validations
  final RxString _passwordController = ''.obs;
  final RxString _passwordError = ''.obs;

  onPasswordEntered(data) {
    _passwordController(data);

    if (_passwordController.value.isEmpty ||
        _passwordController.value.length < 5) {
      _passwordError('Invalid Password');
    } else {
      _passwordError.value = '';
    }
  }

  get onPasswordError {
    if (_passwordError.value.isNotEmpty) {
      return _passwordError.value;
    }
  }

  Future<bool?> get submitValid async {
    if (_passwordError.value.isEmpty &&
        _emailError.value.isEmpty &&
        _emailController.value.isNotEmpty &&
        _passwordController.value.isNotEmpty) {
      showLoader(true);
      final loginResp = await _loginNetwork.fetchLoginApi(LoginApiRequest(
              email: _emailController.value,
              password: _passwordController.value)
          .toJson());
      showLoader(false);

      if (loginResp) {
        _loggedInState.write(kLoginStorage, _emailController.value);
        return true;
      } else {
        return false;
      }
    } else {
      showLoader(false);
      onEmailEntered(_emailController.value);
      onPasswordEntered(_passwordController.value);
      return null;
    }
  }

  get loggedInStorage => _loggedInState.read(kLoginStorage) ?? false;

  @override
  void onClose() {
    _emailController.close();
  }
}
