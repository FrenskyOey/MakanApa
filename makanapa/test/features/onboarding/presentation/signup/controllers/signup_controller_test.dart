import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/onboarding/domain/models/auth.dart';
import 'package:makanapa/features/onboarding/domain/repositories/login_repository.dart';
import 'package:makanapa/features/onboarding/presentation/signup/controllers/signup_controller.dart';
import 'package:makanapa/features/onboarding/presentation/signup/controllers/state/signup_event_state.dart';
import 'package:makanapa/features/onboarding/provider/onboarding_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

import 'signup_controller_test.mocks.dart';

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

  group('SignUpController', () {
    test('isInputEmailValid should update state with valid email', () {
      final controller = container.read(signUpControllerProvider.notifier);
      const tEmail = 'test@email.com';

      final result = controller.isInputEmailValid(tEmail);

      final state = container.read(signUpControllerProvider);
      expect(state.email, tEmail);
      expect(state.errorEmail, isEmpty);
      expect(result, isEmpty);
    });

    test('isInputPasswordValid should update state with valid password', () {
      final controller = container.read(signUpControllerProvider.notifier);
      const tPassword = 'password123';

      final result = controller.isInputPasswordValid(tPassword);

      final state = container.read(signUpControllerProvider);
      expect(state.password, tPassword);
      expect(state.errorPassword, isEmpty);
      expect(result, isEmpty);
    });

    test('isUserNameValid should update state with valid name', () {
      final controller = container.read(signUpControllerProvider.notifier);
      const tName = 'Test User';

      final result = controller.isUserNameValid(tName);

      final state = container.read(signUpControllerProvider);
      expect(state.name, tName);
      expect(state.errorName, isEmpty);
      expect(result, isEmpty);
    });

    test('isPhoneNumberValid should update state with valid phone', () {
      final controller = container.read(signUpControllerProvider.notifier);
      const tPhone = '08123456789';

      final result = controller.isPhoneNumberValid(tPhone);

      final state = container.read(signUpControllerProvider);
      expect(state.phoneNumber, tPhone);
      expect(state.errorPhone, isEmpty);
      expect(result, isEmpty);
    });

    test('isConfirmPasswordValid should update state when passwords match', () {
      final controller = container.read(signUpControllerProvider.notifier);
      const tPassword = 'password123';

      // Set password first so comparison works
      controller.isInputPasswordValid(tPassword);

      final result = controller.isConfirmPasswordValid(tPassword);

      final state = container.read(signUpControllerProvider);
      expect(state.confirmPassword, tPassword);
      expect(state.errorConfirmPassword, isEmpty);
      expect(result, isEmpty);
    });

    test(
      'signUpWithEmail should emit loading then toHomePage when successful',
      () async {
        final subscription = container.listen(
          signUpControllerProvider,
          (_, __) {},
        );
        final controller = container.read(signUpControllerProvider.notifier);

        final tAuthData = AuthData(
          userId: '123',
          email: 'test@email.com',
          role: 'user',
          provider: 'email',
        );

        // Arrange
        when(
          mockRepo.signUpWithEmailAndPassword(any),
        ).thenAnswer((_) async => Right(tAuthData));

        // Act & Assert
        final expectation = expectLater(
          controller.events,
          emitsInOrder([
            const SignUpEventState.showLoading(),
            const SignUpEventState.toHomePage(),
          ]),
        );

        await controller.signUpWithEmail();
        await expectation;
        subscription.close();
      },
    );
  });
}
