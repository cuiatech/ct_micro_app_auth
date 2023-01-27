import 'package:flut_micro_app_auth/app/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';

import '../../shared/widgets/left_panel.dart';
import 'login_form.dart';
import '../../shared/widgets/right_panel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
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
                          CuiaText.headline1("Login"),
                          const SizedBox(height: 33),
                          CuiaText.subtitle1(
                            "Por favor, preencha suas informações abaixo",
                          ),
                          const SizedBox(height: 33),
                          LoginForm(
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
