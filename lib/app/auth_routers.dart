import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';

class AuthRouters {
  static goToWorkspace() => Modular.to.navigate(RoutersName.index);
  static goToLogin() => Modular.to.navigate(RoutersName.login);
  static goToRegister() => Modular.to.navigate(RoutersName.register);
  static goToForgotPassword() =>
      Modular.to.navigate(RoutersName.forgotPassword);
}

class RoutersName {
  static String index = "/";
  static String login = "/auth";
  static String register = "/auth/register";
  static String forgotPassword = "/auth/forgot-password";
}
