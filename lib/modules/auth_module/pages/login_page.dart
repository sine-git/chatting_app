import 'package:chatting_app/app_utils.dart';
import 'package:chatting_app/components/app_button.dart';
import 'package:chatting_app/components/app_textfield.dart';
import 'package:chatting_app/home_page.dart';
import 'package:chatting_app/modules/auth_module/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthService _authService = Modular.get<AuthService>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _login(String email, String password) async {
    try {
      showLoading(context);
      UserCredential userCredential = await _authService.login(email, password);

      closeDialog(context);
      showSuccess(context, "Authention successful");

      Modular.to.navigate("/home-page");
    } catch (e) {
      closeDialog(context);
      showError(context, e.toString());
    }
  }

  bool _isFormFiflled() {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person_4_rounded,
                size: 100,
              ),
            ),
            AppTextField(
              hintText: "",
              label: "Email",
              obscureText: false,
              controller: _emailController,
              onchanged: (value) {
                setState(() {});
              },
            ),
            AppTextField(
              controller: _passwordController,
              hintText: "",
              label: "Password",
              obscureText: true,
              onchanged: (value) {
                setState(() {});
              },
            ),
            AppButton(
              text: "Login",
              onTap: !_isFormFiflled()
                  ? null
                  : () {
                      _login(_emailController.text, _passwordController.text);
                    },
            )
          ],
        ),
      ),
    );
  }
}
