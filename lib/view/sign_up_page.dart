import 'package:e_comm_project/controller/auth_provider.dart';
import 'package:e_comm_project/view/widgets/button.dart';
import 'widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpPage({super.key});

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
              'Signup Form',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            InputFields(controller: _nameController, label: 'Name'),
            const SizedBox(height: 10),
            InputFields(controller: _emailController, label: 'Email'),
            const SizedBox(height: 10),
            InputFields(controller: _passwordController, label: 'Password'),
            const SizedBox(height: 20),
            CustomButton(
                onPressed: () async {
                  await context.read<AuthProvider>().signUp(
                      _nameController.text,
                      _emailController.text,
                      _passwordController.text,
                      context);
                },
                buttonName: 'Sign Up')
          ],
        ),
      ),
    );
  }
}
