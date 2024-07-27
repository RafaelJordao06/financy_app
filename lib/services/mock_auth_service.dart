import 'package:financy_app/common/constants/models/user_model.dart';
import 'package:financy_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode.toString(),
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw Exception('Erro ao logar. Tente novamente.');
      }
      throw Exception(
          'Não foi possível realizar login nesse momento. Tente mais tarde.');
    }
  }

  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode.toString(),
        name: name,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw Exception('Senha insegura. Digite uma senha forte.');
      }
      throw Exception(
          'Não foi possível criar sua conta nesse momento. Tente mais tarde.');
    }
  }
}
