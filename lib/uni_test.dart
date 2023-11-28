import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_zen_up/shareed_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'Cubit/create_new_pass_state.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _latestLink = 'Unknown';

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    try {
      String? initialLink = await getInitialLink();
      handleLink(initialLink);

      // Listen for incoming links
      await for (String? link in getLinksStream()) {
        handleLink(link);
      }
    } on Exception catch (e) {
      print('Error initializing uni_links: $e');
    }
  }

  void handleLink(String? link) {
    if (link != null) {
      // Process the link
      print('Received link: $link');

      // Check if it's a password reset link
      if (link.contains('reset-password')) {
        // Navigate to the password reset page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateNewPasswordPage(
                    resetLink: link,
                  )),
        );
      }

      // Update _latestLink
      setState(() {
        _latestLink = link;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Create '),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
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
                        'Create New Password',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  handleLink('https://example.com/reset-password/');
                },
              ),
            ),
            //    Text('Latest link: $_latestLink'),
            // ElevatedButton(
            //   onPressed: () {
            //     // Simulate sending a password reset email with a deep link
            //     // Replace this with actual logic to send a reset link
            //     handleLink('https://example.com/reset-password/');
            //   },
            //   child: Text('Create New Password'),
            // ),
          ],
        ),
      ),
    );
  }
}

class CreateNewPasswordPage extends StatelessWidget {
  final String resetLink;
  final ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(false);
  final TextEditingController newPasswordController = TextEditingController();

  CreateNewPasswordPage({required this.resetLink});

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
                    valueListenable: passwordVisible,
                    builder: (context, isVisible, child) {
                      return TextField(
                        onTap: () async {
                          final newPassword = newPasswordController.text;
                          final token = await getTokenFromLocal();
                          if (token != null) {
                            createNewPasswordBloc.add(
                              CreateNewPasswordButtonPressed(
                                newPassword,
                                token,
                              ),
                            );
                          } else {
                            print('token Emmmmmmpty');
                          }
                        },
                        controller: newPasswordController,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                            // Your existing decoration code
                            ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: passwordVisible,
                    builder: (context, isVisible, child) {
                      return TextField(
                        onTap: () async {
                          final newPassword = newPasswordController.text;
                          final token = await getTokenFromLocal();
                          if (token != null) {
                            createNewPasswordBloc.add(
                              CreateNewPasswordButtonPressed(
                                newPassword,
                                token,
                              ),
                            );
                          } else {
                            // Handle token not available
                          }
                        },
                        controller: newPasswordController,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                            // Your existing decoration code
                            ),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () async {
                      final newPassword = newPasswordController.text;
                      final token = await getTokenFromLocal();
                      if (token != null) {
                        createNewPasswordBloc.add(
                          CreateNewPasswordButtonPressed(
                            newPassword,
                            token,
                          ),
                        );
                      } else {
                        // Handle token not available
                      }
                    },
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
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Future<String?> getTokenFromLocal() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('token');
  // }
}
