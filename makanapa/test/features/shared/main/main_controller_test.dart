import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
import 'package:makanapa/features/shared/main/main_controller.dart';
import 'package:makanapa/features/shared/main/state/main_event.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod/riverpod.dart';

import 'main_controller_test.mocks.dart';

@GenerateMocks([AvaiblityItem])
void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('MainController', () {
    test('openTypeBottomSheet should emit openTypeBottomSheet event', () async {
      final subscription = container.listen(mainControllerProvider, (_, __) {});
      final controller = container.read(mainControllerProvider.notifier);
      const tType = 'Breakfast';

      final expectation = expectLater(
        controller.events,
        emits(const MainEvent.openTypeBottomSheet(tType)),
      );

      controller.openTypeBottomSheet(tType);
      await expectation;
      subscription.close();
    });

    test(
      'onTypeBottomSheetResult should emit typeBottomSheetResult event',
      () async {
        final subscription = container.listen(
          mainControllerProvider,
          (_, __) {},
        );
        final controller = container.read(mainControllerProvider.notifier);
        const tType = 'Lunch';

        final expectation = expectLater(
          controller.events,
          emits(const MainEvent.typeBottomSheetResult(tType)),
        );

        controller.onTypeBottomSheetResult(tType);
        await expectation;
        subscription.close();
      },
    );

    test(
      'openAvaiblityBottomSheet should emit openAvaibilityBottomSheet event',
      () async {
        final subscription = container.listen(
          mainControllerProvider,
          (_, __) {},
        );
        final controller = container.read(mainControllerProvider.notifier);
        final tItems = [MockAvaiblityItem()];

        final expectation = expectLater(
          controller.events,
          emits(MainEvent.openAvaibilityBottomSheet(tItems)),
        );

        controller.openAvaiblityBottomSheet(tItems);
        await expectation;
        subscription.close();
      },
    );

    test(
      'onAvaiblitySelected should emit avaibilityBottomSheetResult event',
      () async {
        final subscription = container.listen(
          mainControllerProvider,
          (_, __) {},
        );
        final controller = container.read(mainControllerProvider.notifier);
        final tItem = MockAvaiblityItem();

        final expectation = expectLater(
          controller.events,
          emits(MainEvent.avaibilityBottomSheetResult(tItem)),
        );

        controller.onAvaiblitySelected(tItem);
        await expectation;
        subscription.close();
      },
    );
  });
}
