// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flut_micro_app_auth/app/presentation/register/register_controller.dart';
import 'package:flut_micro_app_auth/app/presentation/update_password/update_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';

class UpdatePasswordForm extends StatelessWidget {
  const UpdatePasswordForm({
    Key? key,
    required this.controller,
    required this.code,
  }) : super(key: key);

  final UpdatePasswordController controller;
  final String code;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    bool isValid = true;
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: controller.passwordTextController,
            hintText: "update-password-page-new-password-field".i18n(),
            prefixIcon: CuiaIcons.lock(),
            validateRules: const [Rule.required, Rule.password],
            errorCallback: (_) => isValid = false,
            obscureText: true,
          ),
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: controller.repasswordTextController,
            hintText: "update-password-page-repeat-new-password-field".i18n(),
            prefixIcon: CuiaIcons.lock(),
            validateRules: const [Rule.required, Rule.password],
            errorCallback: (_) => isValid = false,
            obscureText: true,
          ),
          const SizedBox(height: 33),
          CuiaButtons.elevated(
            "update-password-page-submit-button".i18n(),
            onTap: () async {
              isValid = true;
              formKey.currentState!.validate();
              if (isValid) {
                await controller.submit(context, code);
              }
            },
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "register-page-you-have-account".i18n(),
                style: GoogleFonts.poppins(
                  color: const Color(0xff393d6e),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: controller.goToLogin,
                child: Text(
                  "register-page-you-have-account-link".i18n(),
                  style: GoogleFonts.poppins(
                    color: const Color(0xff007dfa),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
