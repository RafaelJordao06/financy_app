import 'package:financy_app/common/constants/models/user_model.dart';
import 'package:financy_app/features/splash/splash_controller.dart';
import 'package:financy_app/features/splash/splash_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_classes.dart';

void main() {
  late MockSecureStorage secureStorage;
  late SplashController splashController;
  late UserModel user;

  setUp(() {
    secureStorage = MockSecureStorage();
    splashController = SplashController(secureStorage);
    user = UserModel(
      name: 'User',
      email: 'user@email.com',
      id: '1a2b3c4d5e',
    );
  });

  group('Tests Splash Controller', () {
    test('Should update state to UnauthenticatedUser', () async {
      when(() => secureStorage.readOne(key: 'CURRENT_USER'))
          .thenAnswer((_) async => null);

      expect(splashController.state, isInstanceOf<SplashStateInitial>());

      await splashController.isUserLogged();

      expect(splashController.state, isInstanceOf<UnauthenticatedUser>());
    });
    test('Should update state to AuthenticatedUser', () async {
      when(() => secureStorage.readOne(key: 'CURRENT_USER'))
          .thenAnswer((_) async => user.toJson());

      expect(splashController.state, isInstanceOf<SplashStateInitial>());

      await splashController.isUserLogged();

      expect(splashController.state, isInstanceOf<AuthenticatedUser>());
    });
  });
}
