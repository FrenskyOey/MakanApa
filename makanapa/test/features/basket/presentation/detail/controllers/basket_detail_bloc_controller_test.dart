import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_upcoming_embed.dart';
import 'package:makanapa/features/basket/domain/models/basket_group.dart';
import 'package:makanapa/features/basket/domain/models/basket_item.dart';
import 'package:makanapa/features/basket/domain/repositories/basket_repository.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/basket_detail_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_event.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_ui_state.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'basket_detail_bloc_controller_test.mocks.dart';

@GenerateMocks([BasketRepository])
void main() {
  late MockBasketRepository mockRepository;
  late BasketDetailBloc bloc;

  setUp(() {
    mockRepository = MockBasketRepository();
    bloc = BasketDetailBloc(repository: mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('BasketDetailBloc Controller Test', () {
    final embed = BasketUpcomingEmbed()
      ..groupId = 1
      ..startDate = DateTime.now()
      ..endDate = DateTime.now();

    final tItem = embed.toDomain();

    blocTest<BasketDetailBloc, BasketDetailUiState>(
      'LoadDetailEvent should emit Loading then Success state',
      build: () {
        when(
          mockRepository.getIngridientData(groupId: 1),
        ).thenAnswer((_) async => const Right(null));
        when(
          mockRepository.getBasketData(groupId: 1, type: anyNamed('type')),
        ).thenAnswer((_) => const Stream.empty());
        return bloc;
      },
      act: (bloc) => bloc.add(LoadDetailEvent(tItem)),
      wait: const Duration(milliseconds: 600),
      expect: () => [
        predicate<BasketDetailUiState>((state) {
          return state.state is Loading &&
              state.detailData == tItem &&
              !state.isDataLoaded;
        }),
        predicate<BasketDetailUiState>((state) {
          return state.state is Success && state.isDataLoaded;
        }),
      ],
      verify: (_) {
        verify(mockRepository.getIngridientData(groupId: 1)).called(1);
      },
    );

    blocTest<BasketDetailBloc, BasketDetailUiState>(
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

    blocTest<BasketDetailBloc, BasketDetailUiState>(
      'OpenPlanDetailEvent should emit effect (no state change)',
      build: () => bloc,
      act: (bloc) => bloc.add(OpenPlanDetailEvent(1)),
      expect: () => [],
    );

    blocTest<BasketDetailBloc, BasketDetailUiState>(
      'IngredientsGroupdEvent should update vegetableBasket when type is vegetable',
      build: () => bloc,
      act: (bloc) => bloc.add(
        IngredientsGroupdEvent(
          BasketGroup(
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
          ),
        ),
      ),
      expect: () => [
        predicate<BasketDetailUiState>(
          (state) => state.vegetableBasket.isNotEmpty,
        ),
      ],
    );
  });
}
