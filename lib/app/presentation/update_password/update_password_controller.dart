// ignore_for_file: depend_on_referenced_packages

import 'package:ct_micro_app_auth/app/auth_routers.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';
import 'package:ct_micro_commons_auth/app/domain/usecases/user_update_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final $UpdatePasswordController = Bind.singleton(
  (i) => UpdatePasswordController(i()),
);

class UpdatePasswordController {
  UpdatePasswordController(this._userUpdatePasswordUsecase);
  final UserUpdatePasswordUsecase _userUpdatePasswordUsecase;

  final passwordTextController = TextEditingController();
  final repasswordTextController = TextEditingController();

  void goToLogin() => AuthRouters.goToLogin();

  Future<void> submit(BuildContext context, String code) async {
    if (code == '') {
      CuiaToast.error('Link inválido', context: context);
      return;
    }

    if (passwordTextController.text == repasswordTextController.text) {
      var res = await _userUpdatePasswordUsecase(
        code,
        passwordTextController.text,
      );
      if (!res.success) {
        CuiaToast.error(res.message ?? 'error-generic'.i18n(),
            context: context);
        return;
      }

      CuiaToast.success('update-password-page-submit-success'.i18n(),
          context: context);
      goToLogin();
    } else {
      CuiaToast.error(
          'update-password-page-submit-error-passwords-diferents'.i18n(),
          context: context);
      return;
    }
  }
}
