import 'package:flut_micro_app_auth/app/presentation/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool isValid = true;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CuiaTextFormField(
            controller: controller.nameTextController,
            hintText: "Nome Completo",
            prefixIcon: CuiaIcons.profile(),
            validateRules: const [Rule.required, Rule.fullname],
            errorCallback: (_) => isValid = false,
          ),
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: controller.emailTextController,
            hintText: "E-mail",
            prefixIcon: CuiaIcons.shape(),
            validateRules: const [Rule.required, Rule.email],
            errorCallback: (_) => isValid = false,
          ),
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: controller.passwordTextController,
            hintText: "Senha",
            prefixIcon: CuiaIcons.lock(),
            validateRules: const [Rule.required, Rule.password],
            errorCallback: (_) => isValid = false,
            obscureText: true,
          ),
          const SizedBox(height: 33),
          CuiaButtons.elevated(
            "Cadastrar",
            onTap: () async {
              isValid = true;
              _formKey.currentState!.validate();
              if (isValid) {
                await controller.submit(context);
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
