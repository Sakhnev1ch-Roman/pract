import 'dart:async';

import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool showLogin = true; // логин меняем на регистр

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: const EdgeInsets.only(top: 100), //отступ сверху 100 пикселей
        child: Container(
          child: const Align(
            // Align - по умолчанию центрирует текст
            child: Text('Login/Register',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obsecure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          // controler содержит значение текстового поля
          controller: controller,
          obscureText: obsecure, // Скрываем пароль звездочками?
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white30), //толстый текст,
              hintText: hint,
              // когда в рамке логина - меняется фокус
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white, width: 3), //в фокусе рамка больше
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white54, width: 1) //не в фокусе
                  ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                    data: IconThemeData(color: Colors.white), child: icon),
              )),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return ElevatedButton(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20),
          ),
          onPressed: () {
            func();
          });
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: _input(Icon(Icons.email), 'EMAIL', _emailController,
                    false) //текст виден
                ),
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _input(Icon(Icons.email), 'PASSWORD',
                    _passwordController, true) // текст скрываем
                ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context)
                    .size
                    .width, // Динамическое нахождение параметров экрана
                child: _button(label, func),
              ),
            )
          ],
        ),
      );
    }

    void _buttonAction() {
      String _email = _emailController.text;
      String _password = _passwordController.text;
      print('The values are: $_email, $_password');
      _emailController.clear();
      _passwordController.clear();
    }

    //создание отдельной страницы
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          (showLogin
              ? Column(
                  children: [
                    _form('LOGIN', _buttonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                          //создали кнопку выбора регистрации или логина
                          child: Text(
                            'Not registerred yet? Register!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              showLogin = false;
                            });
                          }),
                    )
                  ],
                )
              : Column(
                  children: <Widget>[
                    _form('REGISTER', _buttonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                          child: Text(
                            'Not registerred? Login!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              showLogin = true;
                            });
                          }),
                    )
                  ],
                )),
        ],
      ),
    );
  }
}
