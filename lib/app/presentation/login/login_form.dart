// ignore_for_file: depend_on_referenced_packages

import 'package:flut_micro_app_auth/app/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    bool isValid = true;

    return Form(
      key: formKey,
      child: Column(
        children: [
          CuiaTextFormField(
            controller: controller.emailTextController,
            hintText: "login-page-email-field".i18n(),
            prefixIcon: CuiaIcons.shape(),
            validateRules: const [Rule.required, Rule.email],
            errorCallback: (_) => isValid = false,
          ),
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: controller.passwordTextController,
            hintText: "login-page-password-field".i18n(),
            prefixIcon: CuiaIcons.lock(),
            validateRules: const [Rule.required],
            errorCallback: (_) => isValid = false,
            obscureText: true,
          ),
          const SizedBox(height: 33),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: controller.goToForgotPassword,
                child: CuiaButtons.link(
                  "login-page-forgot-password-link".i18n(),
                  onTap: controller.goToForgotPassword,
                ),
              ),
            ],
          ),
          const SizedBox(height: 33),
          CuiaButtons.elevated(
            "login-page-button-submit".i18n(),
            onTap: () async {
              isValid = true;
              formKey.currentState!.validate();
              if (isValid) {
                await controller.submit(context);
              }
            },
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CuiaText(
                "login-page-dont-account".i18n(),
                style: GoogleFonts.poppins(
                  color: const Color(0xff393d6e),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              CuiaButtons.link(
                "login-page-dont-account-link".i18n(),
                onTap: controller.goToRegister,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
