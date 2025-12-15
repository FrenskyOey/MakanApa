import 'dart:convert';

import 'package:isar_community/isar.dart';
import 'package:makanapa/features/home/domain/models/dashboard.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/dashboard_response.dart';

part 'dashboard_isar_model.g.dart';

@collection
class DashboardEntity {
  Id id = 1; // Constant ID because we only have one dashboard state

  @Index()
  late DateTime lastUpdated;

  /// Stores the raw JSON string from the 'home_page' API
  late String jsonBlob;

  /// Creates an empty [RecipeEntity] for Isar.
  DashboardEntity();

  factory DashboardEntity.fromResponse(DashboardResponse response) {
    return DashboardEntity()
      ..id = 1
      ..lastUpdated = DateTime.now()
      ..jsonBlob = json.encode(response.toJson());
  }

  Dashboard toDomain() {
    final Map<String, dynamic> jsonMap = json.decode(jsonBlob);
    final response = DashboardResponse.fromJson(jsonMap);
    return response.toDomain();
  }
}
