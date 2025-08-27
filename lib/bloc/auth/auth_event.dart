part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegisterEvent extends AuthEvent{
  final RegisterModel registerModel;

  RegisterEvent({required this.registerModel});
}
