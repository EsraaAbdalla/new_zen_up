import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';

// State
abstract class CreateNewPasswordState extends Equatable {
  const CreateNewPasswordState();

  @override
  List<Object?> get props => [];
}

class CreateNewPasswordInitial extends CreateNewPasswordState {}

class CreateNewPasswordLoading extends CreateNewPasswordState {}

class CreateNewPasswordSuccess extends CreateNewPasswordState {}

class CreateNewPasswordFailure extends CreateNewPasswordState {
  final String error;

  const CreateNewPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// Event
abstract class CreateNewPasswordEvent extends Equatable {
  const CreateNewPasswordEvent();

  @override
  List<Object?> get props => [];
}

class CreateNewPasswordButtonPressed extends CreateNewPasswordEvent {
  final String newPassword;
  final String resetToken;

  const CreateNewPasswordButtonPressed(this.newPassword, this.resetToken);

  @override
  List<Object?> get props => [newPassword, resetToken];
}

// BLoC
class CreateNewPasswordBloc
    extends Bloc<CreateNewPasswordEvent, CreateNewPasswordState> {
  final http.Client httpClient;

  CreateNewPasswordBloc({required this.httpClient})
      : super(CreateNewPasswordInitial()) {
    on<CreateNewPasswordButtonPressed>(_onCreateNewPasswordButtonPressed);
  }

  void _onCreateNewPasswordButtonPressed(CreateNewPasswordButtonPressed event,
      Emitter<CreateNewPasswordState> emit) async {
    emit(CreateNewPasswordLoading());

    try {
      final response = await httpClient.post(
        Uri.parse('https://meditation-0gig.onrender.com/auth/reset-password'),
        // Replace with your API endpoint
        body: json.encode({
          'newPassword': event.newPassword,
          'resetToken':
              event.resetToken, // Add resetToken to the request payload
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        emit(CreateNewPasswordSuccess());
        print("Success");
      } else {
        final error = json.decode(response.body)['error'] as String;
        emit(CreateNewPasswordFailure(error));
      }
    } catch (error) {
      emit(const CreateNewPasswordFailure(
          'Failed to create new password. Please try again.'));
      print(error);
    }
  }
}
