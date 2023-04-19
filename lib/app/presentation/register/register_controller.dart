import 'package:ct_micro_app_auth/app/auth_routers.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';
import 'package:ct_micro_commons_auth/app/domain/usecases/user_register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final $RegisterController = Bind.singleton(
  (i) => RegisterController(i()),
);

class RegisterController {
  RegisterController(this._userRegisterUsecase);

  final UserRegisterUsecase _userRegisterUsecase;

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void goToLogin() => AuthRouters.goToLogin();

  Future<void> submit(BuildContext context) async {
    var res = await _userRegisterUsecase(
      nameTextController.text,
      emailTextController.text,
      passwordTextController.text,
    );

    if (!res.success) {
      CuiaToast.error(res.message ?? 'error-generic'.i18n(), context: context);
      return;
    }

    CuiaToast.success('register-page-submit-success'.i18n(), context: context);
    goToLogin();
  }
}
