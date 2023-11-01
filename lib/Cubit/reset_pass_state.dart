import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';

// State
abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordFailure extends ResetPasswordState {
  final String error;

  const ResetPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// Event
abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object?> get props => [];
}

class ResetPasswordButtonPressed extends ResetPasswordEvent {
  final String oldPassword;
  final String newPassword;

  const ResetPasswordButtonPressed(this.oldPassword, this.newPassword);

  @override
  List<Object?> get props => [oldPassword, newPassword];
}

// BLoC
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final http.Client httpClient;

  ResetPasswordBloc({required this.httpClient})
      : super(ResetPasswordInitial()) {
    on<ResetPasswordButtonPressed>(_onResetPasswordButtonPressed);
  }

  void _onResetPasswordButtonPressed(ResetPasswordButtonPressed event,
      Emitter<ResetPasswordState> emit) async {
    emit(ResetPasswordLoading());

    try {
      final response = await httpClient.post(
        Uri.parse(
            'https://your-api-endpoint.com/reset_password'), // Replace with your API endpoint
        body: json.encode({
          'oldPassword': event.oldPassword,
          'newPassword': event.newPassword,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        emit(ResetPasswordSuccess());
      } else {
        final error = json.decode(response.body)['error'] as String;
        emit(ResetPasswordFailure(error));
      }
    } catch (error) {
      emit(const ResetPasswordFailure(
          'Failed to reset password. Please try again.'));
    }
  }
}
