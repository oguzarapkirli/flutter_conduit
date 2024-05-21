import 'package:conduit/ui/component/app.screen.dart';
import 'package:conduit/ui/component/generic.textfield.dart';
import 'package:conduit/ui/screen/auth/login.screen.dart';
import 'package:conduit/util/ui_constants.dart';
import 'package:conduit/util/validation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      child: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GenericTextField(
                hintText: 'Username',
                controller: _usernameController,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person),
                textInputAction: TextInputAction.next,
                validationTypes: const [
                  ValidationType.isEmpty,
                  ValidationType.isAlphabetic
                ],
              ),
              const SizedBox(height: UIConstants.mediumValue),
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
              GenericTextField(
                hintText: 'Confirm Password',
                controller: _confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock),
                textInputAction: TextInputAction.done,
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
                    if (!_formKey.currentState!.validate()) return;
                  },
                  child: const Text('Register'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      context.go(LoginScreen.routeName);
                    },
                    child: const Text('Login'),
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
