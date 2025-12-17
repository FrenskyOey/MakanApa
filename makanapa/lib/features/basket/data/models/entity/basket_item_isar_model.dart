import 'package:isar_community/isar.dart';
import 'package:makanapa/features/basket/data/models/response/basket_item_response.dart';
import 'package:makanapa/features/basket/domain/models/basket_item.dart';

part 'basket_item_isar_model.g.dart';

@collection
class BasketItemEntity {
  Id id = Isar.autoIncrement;

  @Index()
  late int groupId;
  @Index()
  late int ingredientId;
  late String name;
  late String unit;
  late String type;
  late int quantity;
  late bool isMarked;

  BasketItemEntity();

  factory BasketItemEntity.fromEntity(
    BasketItemResponse responses,
    int groupId,
    String types,
  ) {
    return BasketItemEntity()
      ..groupId = groupId
      ..ingredientId = responses.id
      ..name = responses.name
      ..unit = responses.unit
      ..type = types
      ..quantity = responses.quantity.toInt();
  }

  BasketItem toDomain() {
    return BasketItem(
      name: name,
      unit: unit,
      qty: quantity,
      type: type,
      isMarked: isMarked,
    );
  }
}
