// ignore_for_file: use_build_context_synchronously, use_full_hex_values_for_flutter_colors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_zen_up/Cubit/create_new_pass_state.dart';
import 'package:new_zen_up/login_page.dart';
import 'package:new_zen_up/ver_code.dart';

String? newPassword;
String? ConfirmNewPassword;
String? token;

class CreateNewPasswordPage extends StatelessWidget {
  final ValueNotifier<bool> newPasswordVisible = ValueNotifier<bool>(false);
  final ValueNotifier<bool> confirmNewPasswordVisible =
      ValueNotifier<bool>(false);
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  CreateNewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreateNewPasswordBloc createNewPasswordBloc =
        BlocProvider.of<CreateNewPasswordBloc>(context);

    return Scaffold(
      body: BlocConsumer<CreateNewPasswordBloc, CreateNewPasswordState>(
        listener: (context, state) {
          if (state is CreateNewPasswordSuccess) {
            // Handle success, e.g., show a success message or navigate to a success screen
          } else if (state is CreateNewPasswordFailure) {
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
          if (state is CreateNewPasswordLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0XFFFC150F6),
                      size: 24,
                    ),
                  ),
                  const Text(
                    'Create New Password ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: newPasswordVisible,
                    builder: (context, isVisible, child) {
                      return TextField(
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
                              newPasswordVisible.value =
                                  !newPasswordVisible.value;
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
                  const SizedBox(
                    height: 15,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: confirmNewPasswordVisible,
                    builder: (context, isVisible, child) {
                      return TextField(
                        controller: confirmNewPasswordController,
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
                              confirmNewPasswordVisible.value =
                                  !confirmNewPasswordVisible.value;
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
                            'Confirm',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      newPassword = newPasswordController.text;
                      ConfirmNewPassword = confirmNewPasswordController.text;

                      // token = await getTokenFromLocal();
                      createNewPasswordBloc.add(
                          CreateNewPasswordButtonPressed(newPassword!, Code!));
                      if (newPassword == ConfirmNewPassword) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            // title: const Text(''),
                            content:
                                const Text('Both Password are not the same'),
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
