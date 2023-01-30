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
    final _formKey = GlobalKey<FormState>();
    bool isValid = true;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: controller.passwordTextController,
            hintText: "Nova Senha",
            prefixIcon: CuiaIcons.lock(),
            validateRules: const [Rule.required, Rule.password],
            errorCallback: (_) => isValid = false,
            obscureText: true,
          ),
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: controller.repasswordTextController,
            hintText: "Repetir Nova Senha",
            prefixIcon: CuiaIcons.lock(),
            validateRules: const [Rule.required, Rule.password],
            errorCallback: (_) => isValid = false,
            obscureText: true,
          ),
          const SizedBox(height: 33),
          CuiaButtons.elevated(
            "Alterar",
            onTap: () async {
              isValid = true;
              _formKey.currentState!.validate();
              if (isValid) {
                await controller.submit(context, code);
              }
            },
          ),
          const SizedBox(height: 33),
          const SizedBox(height: 29),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Já possui uma conta?",
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
                  "Entrar",
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
