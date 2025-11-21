import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/profile/presentation/faq/components/faq_header_container.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/components/app_version_widget.dart';

class FaqItemFooterWidget extends HookConsumerWidget {
  const FaqItemFooterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: Text('Informasi Kontak', style: context.titleMedium),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(
                Dimens.md,
                Dimens.xs,
                Dimens.md,
                Dimens.sm,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Untuk pertanyaan dan juga feedback, \nTolong contact kami di frensky.lee@gmail.com',
                    style: context.bodyMedium,
                  ),
                  100.space,
                  const AppVersionWidget(),
                  Dimens.lg.space,
                ],
              ),
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
