import 'package:conduit/ui/component/app.screen.dart';
import 'package:conduit/ui/component/generic.textfield.dart';
import 'package:conduit/ui/screen/auth/register.screen.dart';
import 'package:conduit/ui/screen/master/master.screen.dart';
import 'package:conduit/util/ui_constants.dart';
import 'package:conduit/util/validation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      child: _buildForm(),
    );
  }

  _buildForm() {
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GenericTextField(
                hintText: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
                textInputAction: TextInputAction.next,
                validationTypes: const [
                  ValidationType.isEmpty,
                  ValidationType.isEmail
                ],
              ),
              const SizedBox(height: UIConstants.mediumValue),
              GenericTextField(
                hintText: 'Password',
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock),
                textInputAction: TextInputAction.next,
                isPassword: true,
                validationTypes: const [
                  ValidationType.isEmpty,
                  ValidationType.isStrongPassword
                ],
              ),
              const SizedBox(height: UIConstants.mediumValue),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // if (!_formKey.currentState!.validate()) return;
                    context.go(MasterScreen.routeName);
                  },
                  child: const Text('Login'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      context.go(RegisterScreen.routeName);
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
