import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:makanapa/features/home/data/data_source/remote/plan_remote_ds.dart';
import 'package:makanapa/features/home/domain/models/create_plan_request.dart';

import 'plan_remote_ds_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late PlanRemoteDsImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = PlanRemoteDsImpl(dio: mockDio);
  });

  group('PlanRemoteDataSource', () {
    test(
      'createMealPlan calls correct endpoint and returns CreatePlanResponse',
      () async {
        // Arrange
        final startDate = DateTime(2023, 10, 1);
        final endDate = DateTime(2023, 10, 7);

        // Assuming DailyInput is the class name for items in dailyInputs.
        // Please adjust the class name and constructor if different in your project.
        final dailyInput = DailyPlanInput(
          date: startDate,
          lunchId: 101,
          dinnerId: 102,
        );

        final request = CreatePlanRequest(
          startDate: startDate,
          endDate: endDate,
          dailyInputs: [dailyInput],
        );

        final responseData = {
          'data': {'group_id': 123, 'message': 'Plan created successfully'},
        };

        when(
          mockDio.post('/v1/create_plan', data: anyNamed('data')),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/v1/create_plan'),
            data: responseData,
            statusCode: 200,
          ),
        );

        // Act
        final result = await dataSource.createMealPlan(request);

        // Assert
        expect(result.groupId, 123);
        expect(result.message, 'Plan created successfully');
      },
    );

    test(
      'getDashboardData calls correct endpoint and returns DashboardResponse',
      () async {
        // Arrange
        final responseData = {
          'data': {
            'current_week_plant': null,
            'upcoming_plan': [
              {'group_id': 123, 'start_date': '10-10-2023'},
            ],
            'avaible_plan': [
              {'start_date': '17-10-2023'},
            ],
          },
        };

        when(mockDio.get('/v1/home_page')).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/v1/home_page'),
            data: responseData,
            statusCode: 200,
          ),
        );

        // Act
        final result = await dataSource.getDashboardData();

        // Assert
        verify(mockDio.get('/v1/home_page')).called(1);
        expect(result.upcomingPlans.length, 1);
        expect(result.availablePlans.length, 1);
      },
    );

    test(
      'getWeeklyPlan calls correct endpoint and returns WeeklyPlanResponse',
      () async {
        // Arrange
        const groupId = 123;
        final responseData = {
          'data': {
            'group_id': groupId,
            'start_date': '01-10-2023',
            'end_date': '07-10-2023',
            'meal_plan': [
              {
                'date': '01-10-2023',
                'lunch': {'id': 1, 'name': 'Nasi Goreng'},
                'dinner': {'id': 2, 'name': 'Sate Ayam'},
              },
            ],
          },
        };

        when(
          mockDio.post('/v1/plan_detail', data: {'group_id': groupId}),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/v1/plan_detail'),
            data: responseData,
            statusCode: 200,
          ),
        );

        // Act
        final result = await dataSource.getWeeklyPlan(groupId);

        // Assert
        verify(
          mockDio.post('/v1/plan_detail', data: {'group_id': groupId}),
        ).called(1);

        expect(result.groupId, groupId);
      },
    );
  });
}
