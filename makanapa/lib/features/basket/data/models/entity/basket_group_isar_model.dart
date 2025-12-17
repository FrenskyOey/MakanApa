import 'package:isar_community/isar.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_upcoming_embed.dart';
import 'package:makanapa/features/basket/data/models/response/basket_dashboard_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_upcoming_plan_response.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';

part 'basket_group_isar_model.g.dart';

@collection
class BasketGroupEntity {
  Id id = 1;
  // Constant ID because we only have one main state

  @Index()
  late DateTime lastUpdated;

  late BasketUpcomingEmbed? currentGroup;
  late List<BasketUpcomingEmbed> upcomingData;

  BasketGroupEntity();

  factory BasketGroupEntity.fromEntity(BasketDashboardResponse responses) {
    final currentGroupsId = responses.currentWeekIngredients?.groupId;
    final currentGroupDate = responses.currentWeekIngredients?.startDate;
    BasketUpcomingEmbed? currentGroupResponse;

    if (currentGroupsId != null && currentGroupDate != null) {
      final currentData = BasketUpcomingPlanResponse(
        groupId: currentGroupsId,
        startDate: currentGroupDate,
      );
      currentGroupResponse = BasketUpcomingEmbed.fromEntity(currentData);
    }

    return BasketGroupEntity()
      ..id = 1
      ..lastUpdated = DateTime.now()
      ..currentGroup = currentGroupResponse
      ..upcomingData = responses.upcomingPlans
          .map((e) => BasketUpcomingEmbed.fromEntity(e))
          .toList();
  }

  BasketSummary toDomain() {
    return BasketSummary(
      currentGroup: currentGroup?.toDomain(),
      upcomingGroup: upcomingData.map((e) => e.toDomain()).toList(),
    );
  }
}
