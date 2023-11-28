// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_zen_up/Cubit/login_state.dart';
import 'package:new_zen_up/forget_password.dart';
import 'package:new_zen_up/signup_page.dart';
import 'package:new_zen_up/success_register.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(false);

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.watch<LoginBloc>();

    return Scaffold(
      // appBar: AppBar(title: Text('Login')),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SuccessRegister()),
            );
          } else if (state is LoginFailure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.error),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email TextField
              const Text(
                "Hey there,",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 245, 245, 245),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Color(0xFFFADA4A5),
                  ),
                  prefixIcon: const Icon(Icons.mail, color: Color(0xFFFADA4A5)),
                ),
              ),
              const SizedBox(height: 16),
              // Password TextField
              ValueListenableBuilder<bool>(
                valueListenable: passwordVisible,
                builder: (context, isVisible, child) {
                  return TextField(
                    controller: passwordController,
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 245, 245, 245),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14)),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Color(0xFFFADA4A5),
                      ),
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xFFFADA4A5)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          passwordVisible.value = !passwordVisible.value;
                        },
                        child: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Login Button
              TextButton(
                child: const Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: Color(0XFFFADA4A5),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage()),
                  );
                  // final email = emailController.text;
                  // final password = passwordController.text;
                  // loginBloc.login(email, password);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    minimumSize: const Size(315, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25), // Set the desired circular border radius
                    ),
                    backgroundColor: Color.lerp(const Color(0XFFFCC8FED),
                        const Color(0XFFF6B50F6), 0.5)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  final email = emailController.text;
                  final password = passwordController.text;
                  loginBloc.login(email, password);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Or'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account yet? ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.lerp(const Color(0XFFFC150F6),
                              const Color(0XFFFEEA4CE), 0.5)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
