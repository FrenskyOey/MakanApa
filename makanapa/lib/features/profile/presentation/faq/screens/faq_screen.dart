import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/profile/presentation/faq/components/faq_item_footer_widget.dart';
import 'package:makanapa/features/profile/presentation/faq/components/faq_item_list_widget.dart';
import 'package:makanapa/features/profile/presentation/faq/controllers/faq_controller.dart';
import 'package:makanapa/features/profile/presentation/faq/controllers/state/faq_event_state.dart';

class FaqScreen extends HookConsumerWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(faqControllerProvider.select((value) => value.eventState), (
      prev,
      next,
    ) {
      next.maybeWhen(
        showLoading: () {},
        toastError: (message) {
          ref.read(faqControllerProvider.notifier).resetState();
        },
        orElse: () {},
      );
    });

    void initStates() async {
      if (!context.mounted) {
        return;
      }
      await ref.read(faqControllerProvider.notifier).initStream();
    }

    void reloadData() async {
      if (!context.mounted) {
        return;
      }
      await ref.read(faqControllerProvider.notifier).reloadFaqData();
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        initStates();
        reloadData();
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('Faq')),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [const FaqItemListWidget(), const FaqItemFooterWidget()],
        ),
      ),
    );
  }
}
