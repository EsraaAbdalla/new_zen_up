// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());

      // Make API request
      print(email.runtimeType);
      print(password.runtimeType);

      final response = await http.post(
          Uri.parse('https://meditation-0gig.onrender.com/auth/signIn'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({"email": email, "password": password}));

      if (response.statusCode == 201) {
        emit(LoginSuccess());
        print('Success');
      } else {
        emit(LoginFailure('Invalid credentials'));
        print(response.headers);
      }
    } catch (e) {
      emit(LoginFailure('An error occurred'));
    }
  }
}

// Define the login states
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}