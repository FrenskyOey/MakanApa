import 'package:makanapa/features/basket/domain/models/basket_group.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';

sealed class BasketDetailEvent {
  const BasketDetailEvent();
}

class LoadDetailEvent extends BasketDetailEvent {
  final BasketOptionItem item;
  const LoadDetailEvent(this.item);
}

class MarkingItemEvent extends BasketDetailEvent {
  final bool isMarking;
  final int groupId;
  final int ingredientsId;
  const MarkingItemEvent(this.isMarking, this.groupId, this.ingredientsId);
}

class OpenPlanDetailEvent extends BasketDetailEvent {
  final int groupId;
  const OpenPlanDetailEvent(this.groupId);
}

class IngredientsGroupdEvent extends BasketDetailEvent {
  final BasketGroup data;
  const IngredientsGroupdEvent(this.data);
}
