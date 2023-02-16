// ignore_for_file: depend_on_referenced_packages

import 'package:ct_micro_app_auth/app/presentation/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ForgotPasswordController controller;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final formKey = GlobalKey<FormState>();
  bool isValid = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CuiaTextFormField(
            controller: widget.controller.emailTextController,
            hintText: "forgot-password-page-email-field".i18n(),
            prefixIcon: CuiaIcons.shape(),
            validateRules: const [Rule.required, Rule.email],
          ),
          const SizedBox(height: 33),
          CuiaButtons.elevated(
            "forgot-password-page-button-submit".i18n(),
            onTap: () async {
              isValid = true;
              formKey.currentState!.validate();
              if (isValid) {
                setState(() => loading = true);
                await widget.controller.submit(context);
                setState(() => loading = false);
              }
            },
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CuiaText(
                "register-page-you-have-account".i18n(),
                style: GoogleFonts.poppins(
                  color: const Color(0xff393d6e),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              CuiaButtons.link(
                "register-page-you-have-account-link".i18n(),
                onTap: widget.controller.goToLogin,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
