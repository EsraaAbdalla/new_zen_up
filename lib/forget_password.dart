// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_zen_up/Cubit/forget_state.dart';

import 'package:new_zen_up/create_new_pass.dart';
import 'package:new_zen_up/login_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordBloc forgotPasswordBloc =
        BlocProvider.of<ForgotPasswordBloc>(context);

    return Scaffold(
      body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            // Handle success, e.g., show a success message or navigate to a success screen
          } else if (state is ForgotPasswordFailure) {
            // Handle failure, e.g., show an error message
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.error),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ForgotPasswordLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Forgot Your Password?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
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
                      labelStyle: const TextStyle(color: Color(0xFFFADA4A5)),
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: Color(0XFFFADA4A5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'We will send you a reset link',
                    style: TextStyle(
                        color: Color(0XFFFADA4A5),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30.0),
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
                          Text(
                            'Send',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      final email = emailController.text;
                      forgotPasswordBloc
                          .add(ForgotPasswordButtonPressed(email));
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CreateNewPasswordPage();
                          });
                    },
                  ),
                  const SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Cancel?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.lerp(const Color(0XFFFC150F6),
                              const Color(0XFFFEEA4CE), 0.5)),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
