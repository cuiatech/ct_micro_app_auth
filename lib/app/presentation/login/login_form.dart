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
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CuiaTextFormField(
            controller: TextEditingController(),
            hintText: "E-mail",
            prefixIcon: CuiaIcons.shape(),
            validateRules: const [Rule.required, Rule.email],
          ),
          const SizedBox(height: 33),
          CuiaTextFormField(
            controller: TextEditingController(),
            hintText: "Senha",
            prefixIcon: CuiaIcons.lock(),
            validateRules: const [Rule.required],
            obscureText: true,
          ),
          const SizedBox(height: 33),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: controller.goToForgotPassword,
                child: CuiaText.link("Esqueceu a senha?"),
              ),
            ],
          ),
          const SizedBox(height: 33),
          CuiaButtons.elevated(
            "Entrar",
            onTap: () {
              _formKey.currentState!.validate();
            },
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CuiaText(
                "Não possui uma conta?",
                style: GoogleFonts.poppins(
                  color: const Color(0xff393d6e),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              CuiaButtons.link(
                "Cadastre-se",
                onTap: controller.goToRegister,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
