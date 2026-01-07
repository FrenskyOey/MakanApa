import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/home/presentation/home/controllers/pager_controller.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('PagerController', () {
    test('initial state is 0.0', () {
      final state = container.read(pagerControllerProvider);
      expect(state, 0.0);
    });

    test('updateSelectedIndex updates state correctly', () {
      // Listen to the provider to ensure it stays mounted during the test
      container.listen(pagerControllerProvider, (_, __) {});

      final controller = container.read(pagerControllerProvider.notifier);

      // Act: Update to 1.0
      controller.updateSelectedIndex(1.0);
      // Assert
      expect(container.read(pagerControllerProvider), 1.0);

      // Act: Update to 2.5
      controller.updateSelectedIndex(2.5);
      // Assert
      expect(container.read(pagerControllerProvider), 2.5);
    });
  });
}
