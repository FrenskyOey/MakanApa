import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/shared/token/domain/token_repository.dart';
import 'package:makanapa/features/shared/token/provider/token_provider.dart';
import 'package:makanapa/features/shared/token/provider/token_repo_provider.dart';
import 'package:makanapa/features/shared/token/provider/token_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

import 'token_provider_test.mocks.dart';

@GenerateMocks([TokenRepository])
void main() {
  late MockTokenRepository mockRepo;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockTokenRepository();
    // Default stub for onTokenChanged as it is called in build -> initStream
    when(mockRepo.onTokenChanged()).thenAnswer((_) => const Stream.empty());
  });

  tearDown(() {
    container.dispose();
  });

  ProviderContainer createContainer() {
    final container = ProviderContainer(
      overrides: [
        tokenRepositoryProvider.overrideWithValue(mockRepo),
        tokenProvider.overrideWith(TokenNotifier.new),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('TokenNotifier', () {
    const tToken = 'access_token';

    test('build should set initial state to LoginState when token exists', () {
      when(mockRepo.getAccessToken()).thenReturn(tToken);

      container = createContainer();
      final state = container.read(tokenProvider);

      expect(state, const TokenState.loginState(tToken));
    });

    test(
      'build should set initial state to LogoutState when token is null',
      () {
        when(mockRepo.getAccessToken()).thenReturn(null);

        container = createContainer();
        final state = container.read(tokenProvider);

        expect(state, const TokenState.logoutState());
      },
    );

    test('initStream should update state when stream emits', () async {
      final streamController = StreamController<String?>();
      when(mockRepo.getAccessToken()).thenReturn(null);
      when(
        mockRepo.onTokenChanged(),
      ).thenAnswer((_) => streamController.stream);

      container = createContainer();
      // Read to trigger build and initStream
      container.read(tokenProvider);

      // Listen to provider to keep it alive and track changes
      final listener = container.listen(tokenProvider, (_, __) {});

      // Emit token
      streamController.add(tToken);
      await Future.delayed(Duration.zero);

      expect(
        container.read(tokenProvider),
        const TokenState.loginState(tToken),
      );

      // Emit null (logout)
      streamController.add(null);
      await Future.delayed(Duration.zero);

      expect(container.read(tokenProvider), const TokenState.logoutState());

      await streamController.close();
      listener.close();
    });

    test('reloadToken should update state from repository', () {
      when(mockRepo.getAccessToken()).thenReturn(null); // Initial
      container = createContainer();

      // Change repo behavior
      when(mockRepo.getAccessToken()).thenReturn(tToken);

      final notifier = container.read(tokenProvider.notifier);
      final newState = notifier.reloadToken();

      expect(newState, const TokenState.loginState(tToken));
      expect(
        container.read(tokenProvider),
        const TokenState.loginState(tToken),
      );
    });

    test('refreshToken should logout on failure', () async {
      when(mockRepo.getAccessToken()).thenReturn(tToken);
      when(
        mockRepo.performTokenRefresh(),
      ).thenAnswer((_) async => const Left('error'));
      when(mockRepo.logout()).thenAnswer((_) async => const Right(null));

      container = createContainer();
      final notifier = container.read(tokenProvider.notifier);

      final result = await notifier.refreshToken();

      expect(result, null);
      expect(container.read(tokenProvider), const TokenState.logoutState());
      verify(mockRepo.logout()).called(1);
    });

    test('signOut should call logout on repo and update state', () async {
      when(mockRepo.getAccessToken()).thenReturn(tToken);
      when(mockRepo.logout()).thenAnswer((_) async => const Right(null));

      container = createContainer();
      final notifier = container.read(tokenProvider.notifier);

      await notifier.signOut();

      expect(container.read(tokenProvider), const TokenState.logoutState());
      verify(mockRepo.logout()).called(1);
    });
  });
}
