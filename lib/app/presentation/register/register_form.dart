import 'package:ct_micro_app_auth/app/presentation/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RegisterController controller;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
            controller: widget.controller.nameTextController,
            hintText: "register-page-name-field".i18n(),
            prefixIcon: CuiaIcons.profile(),
            validateRules: const [Rule.required, Rule.fullname],
            errorCallback: (_) => isValid = false,
          ),
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: widget.controller.emailTextController,
            hintText: "register-page-email-field".i18n(),
            prefixIcon: CuiaIcons.shape(),
            validateRules: const [Rule.required, Rule.email],
            errorCallback: (_) => isValid = false,
          ),
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: widget.controller.passwordTextController,
            hintText: "register-page-password-field".i18n(),
            prefixIcon: CuiaIcons.lock(),
            validateRules: const [Rule.required, Rule.password],
            errorCallback: (_) => isValid = false,
            obscureText: true,
          ),
          const SizedBox(height: 33),
          CuiaButtons.elevated(
            "register-page-button-submit".i18n(),
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
                onTap: widget.controller.goToLogin,
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
