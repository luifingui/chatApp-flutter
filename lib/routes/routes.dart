import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/loading_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/pages/usuarios_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {

  'usuarios': (_) => UsuariosPage(),
  'register': (_) => RegisterPage(),
  'login'   : (_) => LoginPage(),
  'loading' : (_) => LoadingPage(),
  'chat'    : (_) => ChatPage()

};
