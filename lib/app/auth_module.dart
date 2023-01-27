import 'package:flut_micro_app_auth/app/auth_routers.dart';
import 'package:flut_micro_app_auth/app/presentation/login/login_page.dart';
import 'package:flut_micro_app_auth/app/presentation/register/register_page.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      RoutersName.index,
      child: (_, args) => const LoginPage(),
      transition: TransitionType.noTransition,
    ),
    ChildRoute(
      RoutersName.register,
      child: (_, args) => const RegisterPage(),
      transition: TransitionType.noTransition,
    ),
  ];
}
