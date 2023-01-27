import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';

class AuthRouters {
  static goToLogin() => Modular.to.navigate(RoutersName.index);
  static goToRegister() => Modular.to.navigate(RoutersName.register);
}

class RoutersName {
  static String index = "/";
  static String register = "/register";
}
