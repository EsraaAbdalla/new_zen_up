// import 'dart:js';

// import 'package:fluro/fluro.dart';
// import 'package:flutter/material.dart';
// import 'package:new_zen_up/forget_password.dart';

// class RouterFluro {
//   static FluroRouter fluroRouter = FluroRouter();
//   static var screenOnHandler = Handler(
//       handlerFunc: ((BuildContext? context, Map<String, dynamic> params) {
//     return ForgotPasswordPage();
//   }));

//   static initRoutes() {
//     fluroRouter.define("/forget-pass", handler: screenOnHandler);
//   }
// }

// import 'package:fluro/fluro.dart';




// Define a handler for the ForgetPasswordPage


// Define a handler for the ForgetPasswordPage
// var forgetPasswordHandler = Handler(
//   handlerFunc: (context, Map<String, dynamic> params) {
//     // Extract the token from the route
//     String token = params['token']?.first;
//     // Navigate to the ForgetPasswordPage and pass the token
//     return ForgotPasswordPage(token: token);
//   },
// );

// void defineRoutes(Router router) {
//     FluroRouter fluroRouter = FluroRouter();
//   // Define the route for the ForgetPasswordPage with a token parameter
//   router.define('/reset-password/:token', handler: forgetPasswordHandler);
// }
