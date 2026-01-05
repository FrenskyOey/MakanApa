import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/basket/data/data_source/remote/basket_remote_ds.dart';
import 'package:makanapa/features/basket/data/models/response/basket_dashboard_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'basket_remote_ds_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late BasketRemoteDs basketRemoteDs;

  setUp(() {
    mockDio = MockDio();
    basketRemoteDs = BasketRemoteDs(dio: mockDio);
  });

  group('getIngredientByGroupId', () {
    const tGroupId = 123;
    final tSummaryJson = {
      'group_id': 123,
      'start_date': '01-01-2024',
      'bahan': {
        'veg': [
          {'id': 1, 'name': 'Carrot', 'unit': 'kg', 'quantity': 1},
        ],
        'mea': [],
        'oth': [],
      },
    };

    test(
      'should return BasketSummaryResponse when API call is successful',
      () async {
        // Arrange
        when(
          mockDio.post('/v1/ingredients-summary', data: anyNamed('data')),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/v1/ingredients-summary'),
            data: {'data': tSummaryJson},
            statusCode: 200,
          ),
        );

        // Act
        final result = await basketRemoteDs.getIngredientByGroupId(tGroupId);

        // Assert
        expect(result, isA<BasketSummaryResponse>());
        expect(result.groupId, 123);
        expect(result.ingredients.vegetables.length, 1);
      },
    );

    test('should throw DioException when API call fails', () async {
      // Arrange
      when(mockDio.post(any, data: anyNamed('data'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/v1/ingredients-summary'),
          response: Response(
            requestOptions: RequestOptions(path: '/v1/ingredients-summary'),
            statusCode: 404,
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      // Act
      final call = basketRemoteDs.getIngredientByGroupId;

      // Assert
      expect(() => call(tGroupId), throwsA(isA<DioException>()));
    });
  });

  group('getIngredientMainData', () {
    final tDashboardJson = {
      'current_week_ingredients': {
        'group_id': 123,
        'start_date': '01-01-2024',
        'bahan': {'veg': [], 'mea': [], 'oth': []},
      },
      'upcoming_plan': [
        {'group_id': 124, 'start_date': '08-01-2024'},
      ],
    };

    test(
      'should return BasketDashboardResponse when API call is successful',
      () async {
        // Arrange
        when(mockDio.get('/v1/ingredients-dashboard')).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/v1/ingredients-dashboard'),
            data: {'data': tDashboardJson},
            statusCode: 200,
          ),
        );

        // Act
        final result = await basketRemoteDs.getIngredientMainData();

        // Assert
        expect(result, isA<BasketDashboardResponse>());
        expect(result.currentWeekIngredients?.groupId, 123);
        expect(result.upcomingPlans.length, 1);
      },
    );

    test('should throw DioException when API call fails', () async {
      // Arrange
      when(mockDio.get(any)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/v1/ingredients-dashboard'),
          type: DioExceptionType.connectionError,
        ),
      );

      // Act
      final call = basketRemoteDs.getIngredientMainData;

      // Assert
      expect(() => call(), throwsA(isA<DioException>()));
    });
  });
}
