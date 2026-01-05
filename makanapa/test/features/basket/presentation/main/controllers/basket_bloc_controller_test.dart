import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/basket/domain/models/basket_group.dart';
import 'package:makanapa/features/basket/domain/models/basket_item.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
import 'package:makanapa/features/basket/domain/repositories/basket_repository.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/basket_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_event.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'basket_bloc_controller_test.mocks.dart';

@GenerateMocks([BasketRepository])
void main() {
  late MockBasketRepository mockRepository;
  late BasketBloc bloc;

  setUp(() {
    mockRepository = MockBasketRepository();
    bloc = BasketBloc(repository: mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('BasketBloc Controller Test', () {
    blocTest<BasketBloc, BasketUiState>(
      'LoadMainDataEvent should emit Loading then Success with empty lists when currentGroup is null',
      build: () {
        when(
          mockRepository.getIngredientOption(),
        ).thenAnswer((_) => const Stream.empty());
        when(mockRepository.getIngredientsSummary()).thenAnswer(
          (_) async =>
              const Right(BasketSummary(currentGroup: null, upcomingGroup: [])),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(LoadMainDataEvent()),
      wait: const Duration(milliseconds: 2100),
      expect: () => [
        predicate<BasketUiState>((state) => state.state is Loading),
        predicate<BasketUiState>(
          (state) =>
              state.state is Success &&
              state.vegetableBasket.isEmpty &&
              state.meatBasket.isEmpty &&
              state.otherBasket.isEmpty,
        ),
      ],
    );

    blocTest<BasketBloc, BasketUiState>(
      'MarkingItemEvent should call updateMark in repository',
      build: () {
        when(
          mockRepository.updateMark(
            groupId: 1,
            ingredientId: 10,
            isMarked: true,
          ),
        ).thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) => bloc.add(MarkingItemEvent(true, 1, 10)),
      expect: () => [],
      verify: (_) {
        verify(
          mockRepository.updateMark(
            groupId: 1,
            ingredientId: 10,
            isMarked: true,
          ),
        ).called(1);
      },
    );

    final tOptionItem = BasketOptionItem(
      groupId: 1,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    );

    blocTest<BasketBloc, BasketUiState>(
      'OpenDetailItemEvent should emit effect (no state change)',
      build: () => bloc,
      act: (bloc) => bloc.add(OpenDetailItemEvent(tOptionItem)),
      expect: () => [],
    );

    final tSummary = BasketSummary(
      currentGroup: tOptionItem,
      upcomingGroup: [],
    );

    blocTest<BasketBloc, BasketUiState>(
      'SummaryUpdateStreamEvent should update summary and init streams',
      build: () {
        when(
          mockRepository.getBasketData(groupId: 1, type: anyNamed('type')),
        ).thenAnswer((_) => const Stream.empty());
        return bloc;
      },
      act: (bloc) => bloc.add(SummaryUpdateStreamEvent(tSummary)),
      expect: () => [
        predicate<BasketUiState>(
          (state) =>
              state.summaryData == tSummary && state.upcomingData.isEmpty,
        ),
        predicate<BasketUiState>((state) => state.state is Loading),
      ],
      verify: (_) {
        verify(
          mockRepository.getBasketData(
            groupId: 1,
            type: IngredientEnum.vegetable,
          ),
        ).called(1);
      },
    );

    final tGroup = BasketGroup(
      type: IngredientEnum.vegetable.description,
      data: [
        BasketItem(
          id: 1,
          groupId: 1,
          name: 'Carrot',
          unit: 'kg',
          qty: 1,
          type: IngredientEnum.vegetable.description,
          isMarked: false,
        ),
      ],
    );

    blocTest<BasketBloc, BasketUiState>(
      'IngredientsGroupdEvent should update vegetableBasket when type is vegetable',
      build: () => bloc,
      act: (bloc) => bloc.add(IngredientsGroupdEvent(tGroup)),
      expect: () => [
        predicate<BasketUiState>(
          (state) =>
              state.vegetableBasket.length == 1 &&
              state.vegetableBasket.first.name == 'Carrot',
        ),
        predicate<BasketUiState>((state) => state.state is Success),
      ],
    );
  });
}
