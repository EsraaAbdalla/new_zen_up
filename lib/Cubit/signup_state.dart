// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  Future<void> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      emit(SignUpLoading());

      final response = await http.post(
        Uri.parse('https://meditation-0gig.onrender.com/auth/signUp'),
        headers: {"Content-Type": 'application/json'},
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 201) {
        emit(SignUpSuccess());
        print('signUpSuccess');
      } else {
        emit(SignUpFailure('Sign-up failed'));
      }
    } catch (e) {
      print(e);

      emit(SignUpFailure('An error occurred'));
    }
  }
}

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String errorMessage;

  SignUpFailure(this.errorMessage);
}
