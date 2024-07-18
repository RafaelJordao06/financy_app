abstract class SingInState {}

class SignInStateInitial extends SingInState {}

class SignInStateLoading extends SingInState {}

class SignInStateSuccess extends SingInState {}

class SignInStateError extends SingInState {
  final String message;

  SignInStateError(this.message);
}
