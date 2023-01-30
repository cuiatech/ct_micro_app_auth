import 'package:flut_micro_app_auth/app/auth_routers.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';
import 'package:flut_micro_commons_auth/app/domain/usecases/user_register_usecase.dart';
import 'package:flut_micro_commons_auth/app/domain/usecases/user_update_password_usecase.dart';
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
        CuiaToast.error(res.message ?? 'Error', context: context);
        return;
      }

      CuiaToast.success('Senha alterada', context: context);
      goToLogin();
    } else {
      CuiaToast.error('Erro: As senhas fornecidas não coincidem',
          context: context);
      return;
    }
  }
}
