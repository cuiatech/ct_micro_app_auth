import 'package:flut_micro_app_auth/app/presentation/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';

import '../../shared/widgets/left_panel.dart';
import '../../shared/widgets/right_panel.dart';
import 'register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<RegisterController>();
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
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CuiaText.headline1("Cadastre-se"),
                          const SizedBox(height: 33),
                          CuiaText.subtitle1(
                            "Por favor, preencha suas informações abaixo",
                          ),
                          const SizedBox(height: 33),
                          RegisterForm(
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
