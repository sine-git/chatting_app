import 'package:chatting_app/home_page.dart';
import 'package:chatting_app/modules/auth_module/auth_module.dart';
import 'package:chatting_app/modules/auth_module/auth_service.dart';
import 'package:chatting_app/modules/auth_module/pages/login_page.dart';
import 'package:chatting_app/modules/chat_module/chat_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  List<Bind> get binds => [Bind.singleton((i) => AuthService())];

  List<ModularRoute> get routes => [
        ModuleRoute('/', module: AuthModule()),
        ModuleRoute('/chats', module: ChatModule()),
        ChildRoute('/home-page',
            guards: [], child: (context, args) => HomePage())
      ];
}
