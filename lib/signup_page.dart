// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_zen_up/Cubit/signup_state.dart';
import 'package:new_zen_up/login_page.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(false);

  SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final signUpBloc = context.watch<SignUpBloc>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          } else if (state is SignUpFailure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.errorMessage),
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
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0XFFFC150F6),
                        size: 24,
                      ),
                    ),
                  ),
                  // Email TextField
                  const Text(
                    "Hey there,",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    'Create an Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 245, 245, 245),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      labelText: 'First Name',
                      labelStyle: const TextStyle(color: Color(0xFFFADA4A5)),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0XFFFADA4A5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 245, 245, 245),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      labelText: 'Last Name',
                      labelStyle: const TextStyle(color: Color(0xFFFADA4A5)),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0XFFFADA4A5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 16),
                  // Login Button
                  // TextButton(
                  //   child: Text(
                  //     'Forgot your password?',
                  //     style: TextStyle(color: Color(0XFFFADA4A5)),
                  //   ),
                  //   onPressed: () {
                  //     // final email = emailController.text;
                  //     // final password = passwordController.text;
                  //     // loginBloc.login(email, password);
                  //   },
                  // ),
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
                          Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      final firstName = firstNameController.text;
                      final lastName = lastNameController.text;
                      final email = emailController.text;
                      final password = passwordController.text;
                      signUpBloc.signUp(firstName, lastName, email, password);
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
                        "Already have an account?  ",
                        style: TextStyle(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          "Login",
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
        ),
      ),
    );
  }
}



// Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // First Name TextField
//               TextField(
//                 controller: firstNameController,
//                 decoration: InputDecoration(
//                   labelText: 'First Name',
//                 ),
//               ),
//               SizedBox(height: 16),
//               // Last Name TextField
//               TextField(
//                 controller: lastNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Last Name',
//                 ),
//               ),
//               SizedBox(height: 16),
//               // Email TextField
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//               ),
//               SizedBox(height: 16),
//               // Password TextField
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//               ),
//               SizedBox(height: 16),
//               // Sign-Up Button
//               TextButton(
//                 child: Text('Sign Up'),
//                 onPressed: () {
//                   final firstName = firstNameController.text;
//                   final lastName = lastNameController.text;
//                   final email = emailController.text;
//                   final password = passwordController.text;
//                   signUpBloc.signUp(firstName, lastName, email, password);
//                 },
//               ),
//             ],
//           ),