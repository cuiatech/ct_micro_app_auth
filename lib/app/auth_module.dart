import 'package:ct_micro_app_auth/app/auth_routers.dart';
import 'package:ct_micro_app_auth/app/presentation/forgot_password/forgot_password_controller.dart';
import 'package:ct_micro_app_auth/app/presentation/forgot_password/forgot_password_page.dart';
import 'package:ct_micro_app_auth/app/presentation/login/login_controller.dart';
import 'package:ct_micro_app_auth/app/presentation/login/login_page.dart';
import 'package:ct_micro_app_auth/app/presentation/register/register_controller.dart';
import 'package:ct_micro_app_auth/app/presentation/register/register_page.dart';
import 'package:ct_micro_app_auth/app/presentation/update_password/update_password_controller.dart';
import 'package:ct_micro_app_auth/app/presentation/update_password/update_password_page.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';

class AppAuthModule extends Module {
  @override
  final List<Bind> binds = [
    // Controllers
    $RegisterController,
    $LoginController,
    $UpdatePasswordController,
    $ForgotPasswordController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      RoutersName.login,
      child: (_, args) => const LoginPage(),
      transition: TransitionType.noTransition,
    ),
    ChildRoute(
      RoutersName.register,
      child: (_, args) => const RegisterPage(),
      transition: TransitionType.noTransition,
    ),
    ChildRoute(
      RoutersName.forgotPassword,
      child: (_, args) => const ForgotPasswordPage(),
      transition: TransitionType.noTransition,
    ),
    ChildRoute(
      RoutersName.updatePassword,
      child: (_, args) => UpdatePasswordPage(args.queryParams['key'] ?? ''),
      transition: TransitionType.noTransition,
    ),
  ];
}
