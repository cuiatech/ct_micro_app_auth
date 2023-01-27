import 'package:flut_micro_app_auth/app/presentation/forgot_password/forgot_password_controller.dart';
import 'package:flut_micro_app_auth/app/presentation/forgot_password/forgot_password_form.dart';
import 'package:flut_micro_app_auth/app/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';

import '../../shared/widgets/left_panel.dart';
import '../../shared/widgets/right_panel.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ForgotPasswordController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const LeftPanel(
            child: Center(child: CuiaLogo()),
          ),
          RightPanel(
            child: LayoutBuilder(builder: (context, c) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  height: size.height,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: c.maxWidth / 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CuiaText.headline1("Recuperar senha"),
                          const SizedBox(height: 33),
                          CuiaText.subtitle1(
                            "Informe seu e-mail que iremos lhe mandar os passos de recuperação de conta",
                          ),
                          const SizedBox(height: 33),
                          ForgotPasswordForm(
                            controller: controller,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
