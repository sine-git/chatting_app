import 'package:chatting_app/app_utils.dart';
import 'package:chatting_app/components/app_button.dart';
import 'package:chatting_app/components/app_textfield.dart';
import 'package:chatting_app/home_page.dart';
import 'package:chatting_app/modules/auth_module/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthService _authService = Modular.get<AuthService>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  _register(String email, String password) async {
    try {
      if (_passwordController.text != _confirmPasswordController.text) {
        showError(context, "Password and confirmation password don't match");
        return;
      }
      showLoading(context);
      UserCredential userCredential =
          await _authService.singUp(email, password);

      closeDialog(context);
      showSuccess(context, "Registration successful");
      Modular.to.navigate("/login");
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.grey,
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
              AppTextField(
                controller: _confirmPasswordController,
                hintText: "",
                label: "Confirm Password",
                obscureText: true,
                onchanged: (value) {
                  setState(() {});
                },
              ),
              AppButton(
                text: "Register",
                onTap: !_isFormFiflled()
                    ? null
                    : () {
                        _register(
                            _emailController.text, _passwordController.text);
                      },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  TextButton(
                    child: Text("Sign in"),
                    onPressed: () {
                      Modular.to.navigate("/login");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
