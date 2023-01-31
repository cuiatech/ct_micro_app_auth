// ignore_for_file: depend_on_referenced_packages

import 'package:flut_micro_app_auth/app/auth_routers.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_auth/app/domain/usecases/user_login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';

final $LoginController = Bind.singleton(
  (i) => LoginController(i()),
);

class LoginController {
  LoginController(this._userLoginUsecase);

  final UserLoginUsecase _userLoginUsecase;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void goToRegister() => AuthRouters.goToRegister();
  void goToWorkspace() => AuthRouters.goToWorkspace();

  void goToForgotPassword() => AuthRouters.goToForgotPassword();

  Future<void> submit(BuildContext context) async {
    var res = await _userLoginUsecase(
      emailTextController.text,
      passwordTextController.text,
    );

    if (!res.success) {
      CuiaToast.error(res.message ?? 'error-generic'.i18n(), context: context);
      return;
    }

    goToWorkspace();
  }
}
