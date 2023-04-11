part of 'registraition_cubit.dart';

abstract class RegistraitionState {}

class RegistraitionInitial extends RegistraitionState {}

class LoginSuccess extends RegistraitionState {}

class LoginFailuar extends RegistraitionState {
  String error;
  LoginFailuar({required this.error});
}

class LoginProgress extends RegistraitionState {}

class SignupSuccess extends RegistraitionState {}

class SignupFailure extends RegistraitionState {
  String error;
  SignupFailure({required this.error});
}

class SignupProgress extends RegistraitionState {}
