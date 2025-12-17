import 'package:makanapa/features/basket/domain/models/basket_item.dart';

class BasketGroup {
  final String type;
  final List<BasketItem> data;
  const BasketGroup({required this.type, required this.data});
}
