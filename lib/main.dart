// import 'package:flutter/material.dart';
// // import 'package:new_zen_up/accordion_page.dart';

// // import 'package:new_zen_up/try.dart';
// import 'package:new_zen_up/ver_code.dart';
// // import 'package:new_zen_up/uni_test.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: VerificationCode(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     // Define your pages here
//     // Example:
//     Center(child: Text('Page 1')),
//     Center(child: Text('Page 2')),
//     Center(child: Text('Page 3')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Circular Navigation Bar Example'),
//       ),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         index: _currentIndex,
//         height: 60.0,
//         items: <Widget>[
//           Icon(Icons.home, size: 30),
//           Icon(Icons.favorite, size: 30),
//           Icon(Icons.search, size: 30),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     // Define your pages here
//     // Example:
//     Center(child: Text('Page 1')),
//     Center(child: Text('Page 2')),
//     Center(child: Text('Page 3')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Circular Navigation Bar Example'),
//       ),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.blue, // Set the background color of the circle
//         ),
//         child: BottomNavigationBar(
//           backgroundColor: Colors
//               .transparent, // Make the background of the BottomNavigationBar transparent
//           selectedItemColor: Colors.white, // Color of the selected item
//           unselectedItemColor: Colors.grey, // Color of unselected items
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: 'Favorites',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: 'Search',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_zen_up/Cubit/create_new_pass_state.dart';
import 'package:new_zen_up/Cubit/forget_state.dart';
import 'package:new_zen_up/Cubit/login_state.dart';
import 'package:new_zen_up/Cubit/reset_pass_state.dart';
import 'package:new_zen_up/Cubit/signup_state.dart';
import 'package:http/http.dart' as http;
import 'package:new_zen_up/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:new_zen_up/icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> isUserAuthenticated() async {
    // Check if the user is already authenticated
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');

    return token != null;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => ForgotPasswordBloc(httpClient: http.Client()),
        ),
        BlocProvider<CreateNewPasswordBloc>(
          create: (context) => CreateNewPasswordBloc(httpClient: http.Client()),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => ResetPasswordBloc(httpClient: http.Client()),
        ),
        // BlocProvider<AudioBloc>(
        //   create: (context) => AudioBloc(),
        // ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
      ),
    );
  }
}
