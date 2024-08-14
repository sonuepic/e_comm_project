import 'package:e_comm_project/controller/auth_provider.dart';
import 'package:e_comm_project/utils/colors.dart';
import 'widgets/button.dart';
import 'widgets/input_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Login Form',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            InputFields(controller: _emailController, label: 'Email Address'),
            const SizedBox(height: 10),
            InputFields(controller: _passwordController, label: 'Password'),
            const SizedBox(height: 20),
            CustomButton(
                onPressed: () async {
                  await context.read<AuthProvider>().signIn(
                      _emailController.text, _passwordController.text, context);
                },
                buttonName: 'Login'),
            const SizedBox(height: 20),
            Text.rich(TextSpan(children: [
              const TextSpan(
                  text: 'Don\'t have an account',
                  style: TextStyle(color: black)),
              TextSpan(
                  text: '  Signup  ',
                  style: const TextStyle(fontSize: 18, color: blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignUpPage()));
                    })
            ])),
          ],
        ),
      ),
    );
  }
}
