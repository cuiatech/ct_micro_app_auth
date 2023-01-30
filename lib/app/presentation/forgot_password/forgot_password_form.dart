import 'package:flut_micro_app_auth/app/presentation/forgot_password/forgot_password_controller.dart';
import 'package:flut_micro_app_auth/app/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ForgotPasswordController controller;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool isValid = true;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CuiaTextFormField(
            controller: controller.emailTextController,
            hintText: "E-mail",
            prefixIcon: CuiaIcons.shape(),
            validateRules: const [Rule.required, Rule.email],
          ),
          const SizedBox(height: 33),
          CuiaButtons.elevated(
            "Enviar",
            onTap: () async {
              isValid = true;
              _formKey.currentState!.validate();
              if (isValid) {
                await controller.submit(context);
              }
            },
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CuiaText(
                "Já possui uma conta?",
                style: GoogleFonts.poppins(
                  color: const Color(0xff393d6e),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              CuiaButtons.link(
                "Entrar",
                onTap: controller.goToLogin,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
