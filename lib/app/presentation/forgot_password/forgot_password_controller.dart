import 'package:flut_micro_app_auth/app/auth_routers.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_auth/app/domain/usecases/user_forgot_password_usecase.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';
import 'package:flutter/material.dart';

final $ForgotPasswordController = Bind.singleton(
  (i) => ForgotPasswordController(i()),
);

class ForgotPasswordController {
  ForgotPasswordController(this._userForgotPasswordUsecase);
  final UserForgotPasswordUsecase _userForgotPasswordUsecase;

  final emailTextController = TextEditingController();

  void goToLogin() => AuthRouters.goToLogin();

  Future<void> submit(BuildContext context) async {
    var res = await _userForgotPasswordUsecase(
      emailTextController.text,
      '${Uri.base.origin}/auth${RoutersName.updatePassword}',
    );
    if (!res.success) {
      CuiaToast.error(res.message ?? 'Error', context: context);
      return;
    }

    CuiaToast.success('E-mail de recuperação enviado', context: context);
  }
}
