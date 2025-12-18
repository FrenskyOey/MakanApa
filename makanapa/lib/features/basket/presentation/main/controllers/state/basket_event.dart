import 'package:makanapa/features/basket/domain/models/basket_group.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';

sealed class BasketEvent {
  const BasketEvent();
}

class LoadMainDataEvent extends BasketEvent {
  const LoadMainDataEvent();
}

class MarkingItemEvent extends BasketEvent {
  final bool isMarking;
  final int groupId;
  final int ingredientsId;
  const MarkingItemEvent(this.isMarking, this.groupId, this.ingredientsId);
}

class OpenDetailItemEvent extends BasketEvent {
  final int groupId;
  const OpenDetailItemEvent(this.groupId);
}

class SummaryUpdateStreamEvent extends BasketEvent {
  final BasketSummary data;
  const SummaryUpdateStreamEvent(this.data);
}

class IngredientsGroupdEvent extends BasketEvent {
  final BasketGroup data;
  const IngredientsGroupdEvent(this.data);
}
