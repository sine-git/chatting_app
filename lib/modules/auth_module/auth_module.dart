import 'package:chatting_app/modules/auth_module/auth_service.dart';
import 'package:chatting_app/modules/auth_module/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  // List<Bind> get binds => [Bind.singleton((i) => AuthService())];

  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginPage()),
        ChildRoute('/login', child: (context, args) => LoginPage())
      ];
}
