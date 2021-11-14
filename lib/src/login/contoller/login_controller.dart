import 'package:get/get.dart';
import 'package:globant_quiz/src/login/network/login_api.dart';
import 'package:globant_quiz/src/login/network/models/login_req_model.dart';

class LoginController extends GetxController {
  // email validations
  final RxString _emailController = ''.obs;
  final RxString _emailError = ''.obs;

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

  // on Submit
  RxBool showLoader = false.obs;

  Future<bool?> get submitValid async {
    if (_passwordError.value.isEmpty && _emailError.value.isEmpty) {
      showLoader(true);
      return _loginNetwork.fetchLoginApi(LoginApiRequest(
              email: _emailController.value,
              password: _passwordController.value)
          .toJson());
    } else {
      return null;
    }
  }

  //API
  final LoginNetwork _loginNetwork = LoginNetwork();

  @override
  void onInit() {}

  @override
  void onClose() {
    _emailController.close();
  }
}
