import 'package:financy_app/features/sing_in/sign_in_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class SingInController extends ChangeNotifier {
  final AuthService _service;

  SingInController(this._service);

  SingInState _state = SignInStateInitial();

  SingInState get state => _state;

  void _changeState(SingInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    _changeState(SignInStateLoading());
    try {
      await _service.signIn(
        email: email,
        password: password,
      );

      _changeState(SignInStateSuccess());
    } catch (e) {
      _changeState(SignInStateError(e.toString()));
    }
  }
}
