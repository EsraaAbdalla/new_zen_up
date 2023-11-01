// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_zen_up/Cubit/reset_pass_state.dart';
import 'package:new_zen_up/constant.dart';

class ResetPasswordPage extends StatelessWidget {
  final ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(false);

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordBloc resetPasswordBloc =
        BlocProvider.of<ResetPasswordBloc>(context);

    return Scaffold(
      body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            // Handle success, e.g., show a success message or navigate to a success screen
          } else if (state is ResetPasswordFailure) {
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
          if (state is ResetPasswordLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0XFFFC150F6),
                        size: 24,
                      ),
                    ),
                  ),
                  const Text(
                    'Reset Password ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: passwordVisible,
                    builder: (context, isVisible, child) {
                      return TextField(
                        onTap: () {},
                        controller: oldPasswordController,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 245, 245, 245),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14)),
                          labelText: 'Old Password',
                          labelStyle:
                              const TextStyle(color: Color(0xFFFADA4A5)),
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xFFFADA4A5)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              passwordVisible.value = !passwordVisible.value;
                            },
                            child: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ValueListenableBuilder<bool>(
                    valueListenable: passwordVisible,
                    builder: (context, isVisible, child) {
                      return TextField(
                        onTap: () {},
                        controller: newPasswordController,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 245, 245, 245),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14)),
                          labelText: 'New Password',
                          labelStyle:
                              const TextStyle(color: Color(0xFFFADA4A5)),
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xFFFADA4A5)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              passwordVisible.value = !passwordVisible.value;
                            },
                            child: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16.0),
                  ValueListenableBuilder<bool>(
                    valueListenable: passwordVisible,
                    builder: (context, isVisible, child) {
                      return TextField(
                        onTap: () {},
                        controller: confirmPasswordController,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 245, 245, 245),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14)),
                          labelText: 'Confirm New Password',
                          labelStyle:
                              const TextStyle(color: Color(0xFFFADA4A5)),
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xFFFADA4A5)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              passwordVisible.value = !passwordVisible.value;
                            },
                            child: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20.0),
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
                            'Reset',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      final oldPassword = oldPasswordController.text;
                      final newPassword = newPasswordController.text;
                      final confirmPassword = confirmPasswordController.text;

                      if (newPassword != confirmPassword) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'New password and confirm password do not match.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        resetPasswordBloc.add(
                          ResetPasswordButtonPressed(oldPassword, newPassword),
                        );
                      }
                    },
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     final oldPassword = oldPasswordController.text;
                  //     final newPassword = newPasswordController.text;
                  //     final confirmPassword = confirmPasswordController.text;

                  //     if (newPassword != confirmPassword) {
                  //       showDialog(
                  //         context: context,
                  //         builder: (context) => AlertDialog(
                  //           title: Text('Error'),
                  //           content: Text(
                  //               'New password and confirm password do not match.'),
                  //           actions: [
                  //             TextButton(
                  //               onPressed: () => Navigator.pop(context),
                  //               child: Text('OK'),
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     } else {
                  //       resetPasswordBloc.add(
                  //         ResetPasswordButtonPressed(oldPassword, newPassword),
                  //       );
                  //     }
                  //   },
                  //   child: Text('Reset Password'),
                  // ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
