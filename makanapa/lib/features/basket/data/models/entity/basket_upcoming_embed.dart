import 'package:isar_community/isar.dart';
import 'package:makanapa/features/basket/data/models/response/basket_upcoming_plan_response.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';

part 'basket_upcoming_embed.g.dart';

@embedded
class BasketUpcomingEmbed {
  late int groupId;
  late DateTime startDate;
  late DateTime endDate;

  BasketUpcomingEmbed();

  factory BasketUpcomingEmbed.fromEntity(BasketUpcomingPlanResponse response) {
    // Parse "dd-MM-yyyy" manually
    final parts = response.startDate.split('-');
    final start = DateTime(
      int.parse(parts[2]), // Year
      int.parse(parts[1]), // Month
      int.parse(parts[0]), // Day
    );

    return BasketUpcomingEmbed()
      ..groupId = response.groupId
      ..startDate = start
      ..endDate = start.add(const Duration(days: 6));
  }

  BasketOptionItem toDomain() {
    return BasketOptionItem(
      groupId: groupId,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
