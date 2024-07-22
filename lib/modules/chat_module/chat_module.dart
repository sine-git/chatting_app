import 'package:chatting_app/modules/auth_module/auth_service.dart';
import 'package:chatting_app/modules/chat_module/chat_service.dart';
import 'package:chatting_app/modules/chat_module/pages/chat_list.dart';
import 'package:chatting_app/modules/chat_module/pages/chat_room.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatModule extends Module {
  List<Bind> get binds => [
        Bind.singleton((i) => ChatService()),
        Bind.lazySingleton((i) => AuthService())
      ];

  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ChatList()),
        ChildRoute('/chatroom',
            child: (context, args) => ChatRoom(
                email: args.data['email'], userId: args.data['userId']))
      ];
}
