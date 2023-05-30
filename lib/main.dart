import 'package:flutter/material.dart';
import 'package:pract/home.dart';
import 'package:pract/auth.dart';

void main() => runApp(LogRegApp());

//StatelesWidget - без постоянного обьекта состояния, компонент может изменяться в ходе работы
class LogRegApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LoginRegister',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(50, 65, 85, 1),
            // ignore: deprecated_member_use
            textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white))),
        home: AuthorizationPage());
  }
}
