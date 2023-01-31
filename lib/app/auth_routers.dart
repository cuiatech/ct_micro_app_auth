// ignore_for_file: depend_on_referenced_packages

import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';

class AuthRouters {
  static goToWorkspace() => Modular.to.navigate('/');
  static goToLogin() => Modular.to.navigate('/auth${RoutersName.login}');
  static goToRegister() => Modular.to.navigate('/auth${RoutersName.register}');
  static goToForgotPassword() =>
      Modular.to.navigate('/auth${RoutersName.forgotPassword}');
  static goToUpdatePassword() =>
      Modular.to.navigate('/auth${RoutersName.updatePassword}');
}

class RoutersName {
  static String login = "/";
  static String register = "/register";
  static String forgotPassword = "/forgot-password";
  static String updatePassword = "/update-password";
}
