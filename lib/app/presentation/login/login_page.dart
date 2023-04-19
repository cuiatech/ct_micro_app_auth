import 'package:ct_micro_app_auth/app/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';

import '../../shared/widgets/left_panel.dart';
import 'login_form.dart';
import '../../shared/widgets/right_panel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<LoginController>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CuiaFlexRow(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CuiaFlexColumn(
            colS: 0,
            colXS: 0,
            colM: 5,
            child: SizedBox(
              height: size.height,
              child: const LeftPanel(
                child: Center(child: CuiaLogo()),
              ),
            ),
          ),
          CuiaFlexColumn(
            colS: 12,
            colXS: 12,
            colM: 7,
            child: RightPanel(
              child: LayoutBuilder(builder: (context, c) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: c.maxWidth * 0.1,
                    ),
                    height: size.height,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CuiaText.headline1("login-page-title".i18n()),
                          const SizedBox(height: 33),
                          CuiaText.subtitle1("login-page-subtitle".i18n()),
                          const SizedBox(height: 33),
                          LoginForm(
                            controller: controller,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
