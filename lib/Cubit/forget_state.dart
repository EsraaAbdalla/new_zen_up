import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';

// State
abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;

  const ForgotPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// Event
abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordButtonPressed extends ForgotPasswordEvent {
  final String email;

  const ForgotPasswordButtonPressed(this.email);

  @override
  List<Object?> get props => [email];
}

// BLoC
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final http.Client httpClient;

  ForgotPasswordBloc({required this.httpClient})
      : super(ForgotPasswordInitial()) {
    on<ForgotPasswordButtonPressed>(_onForgotPasswordButtonPressed);
  }

  void _onForgotPasswordButtonPressed(ForgotPasswordButtonPressed event,
      Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordLoading());

    try {
      final response = await httpClient.post(
        Uri.parse(
            'https://meditation-0gig.onrender.com/auth/forgot-password'), // Replace with your API endpoint
        body: json.encode({
          'email': event.email,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        emit(ForgotPasswordSuccess());
      } else {
        final error = json.decode(response.body)['error'] as String;
        emit(ForgotPasswordFailure(error));
      }
    } catch (error) {
      print(error);
      emit(const ForgotPasswordFailure(
          'Failed to reset password. Please try again.'));
    }
  }
}
