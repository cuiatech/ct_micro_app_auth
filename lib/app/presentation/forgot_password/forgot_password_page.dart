import 'package:ct_micro_app_auth/app/presentation/forgot_password/forgot_password_controller.dart';
import 'package:ct_micro_app_auth/app/presentation/forgot_password/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';

import '../../shared/widgets/left_panel.dart';
import '../../shared/widgets/right_panel.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ForgotPasswordController>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CuiaFlexRow(
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
                          CuiaText.headline1(
                              "forgot-password-page-title".i18n()),
                          const SizedBox(height: 33),
                          CuiaText.subtitle1(
                              "forgot-password-page-subtitle".i18n()),
                          const SizedBox(height: 33),
                          ForgotPasswordForm(
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
