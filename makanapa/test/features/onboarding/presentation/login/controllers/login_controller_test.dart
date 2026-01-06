import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/onboarding/domain/models/auth.dart';
import 'package:makanapa/features/onboarding/domain/models/google_sign_in_request.dart';
import 'package:makanapa/features/onboarding/domain/repositories/login_repository.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/login_controller.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/state/login_event_state.dart';
import 'package:makanapa/features/onboarding/provider/onboarding_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

import 'login_controller_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  late MockLoginRepository mockRepo;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockLoginRepository();
    container = ProviderContainer(
      overrides: [loginRepositoryProvider.overrideWithValue(mockRepo)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('LoginController', () {
    test('isInputEmailValid should update state with valid email', () {
      final controller = container.read(loginControllerProvider.notifier);
      const tEmail = 'test@email.com';

      // Act
      final result = controller.isInputEmailValid(tEmail);

      // Assert
      final state = container.read(loginControllerProvider);
      expect(state.email, tEmail);
      expect(state.errorEmail, isEmpty);
      expect(result, isEmpty);
    });

    test('isInputPasswordValid should update state with valid password', () {
      final controller = container.read(loginControllerProvider.notifier);
      const tPassword = 'password123';

      // Act
      final result = controller.isInputPasswordValid(tPassword);

      // Assert
      final state = container.read(loginControllerProvider);
      expect(state.password, tPassword);
      expect(state.errorPassword, isEmpty);
      expect(result, isEmpty);
    });

    test('openSignUp should emit toSignUpPage event', () async {
      final controller = container.read(loginControllerProvider.notifier);

      // Act & Assert
      expectLater(
        controller.events,
        emits(const LoginEventState.toSignUpPage()),
      );

      controller.openSignUp();
    });

    test(
      'loginWithEmail should emit toHomePage when login is successful',
      () async {
        final subscription = container.listen(
          loginControllerProvider,
          (_, __) {},
        );
        final controller = container.read(loginControllerProvider.notifier);
        const tEmail = 'test@email.com';
        const tPassword = 'password123';
        final tAuthData = AuthData(
          userId: '123',
          email: tEmail,
          role: 'user',
          provider: 'email',
        );

        // Arrange
        when(
          mockRepo.signInWithEmailAndPassword(tEmail, tPassword),
        ).thenAnswer((_) async => Right(tAuthData));

        // Act & Assert
        final expectation = expectLater(
          controller.events,
          emits(const LoginEventState.toHomePage()),
        );

        await controller.loginWithEmail(tEmail, tPassword);
        await expectation;

        final state = container.read(loginControllerProvider);
        expect(state.isLoginLoading, false);
        verify(
          mockRepo.signInWithEmailAndPassword(tEmail, tPassword),
        ).called(1);
        subscription.close();
      },
    );

    test(
      'loginWithGoogle should emit toHomePage when login is successful',
      () async {
        final subscription = container.listen(
          loginControllerProvider,
          (_, __) {},
        );
        final controller = container.read(loginControllerProvider.notifier);
        final tRequest = GoogleSignInRequest(
          idToken: 'id_token',
          accessToken: 'access_token',
          userName: 'Google User',
          phone: '0987654321',
          avatar: 'avatar_url',
          email: 'test@google.com',
        );
        final tAuthData = AuthData(
          userId: '123',
          email: 'test@google.com',
          role: 'user',
          provider: 'google',
        );

        // Arrange
        when(
          mockRepo.signInWithGoogle(tRequest),
        ).thenAnswer((_) async => Right(tAuthData));

        // Act & Assert
        final expectation = expectLater(
          controller.events,
          emits(const LoginEventState.toHomePage()),
        );

        await controller.loginWithGoogle(tRequest);
        await expectation;
        subscription.close();
      },
    );
  });
}
