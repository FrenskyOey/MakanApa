import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/features/profile/presentation/faq/components/faq_header_container.dart';
import 'package:makanapa/features/profile/presentation/faq/components/faq_item_widget.dart';
import 'package:makanapa/features/profile/presentation/faq/controllers/faq_controller.dart';

class FaqItemListWidget extends HookConsumerWidget {
  const FaqItemListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faqData = ref.watch(
      faqControllerProvider.select((value) => value.faqList),
    );

    return SliverMainAxisGroup(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: FaqHeaderContainer(
            child: Container(
              height: 50,
              color: context.surface,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.0),
              child: Text('FAQ', style: context.titleMedium),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = faqData[index];
            return FaqItemWidget(key: PageStorageKey(item.id), item: item);
          }, childCount: faqData.length),
        ),
      ],
    );
  }
}
