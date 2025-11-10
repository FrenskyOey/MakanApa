/*
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TemplateScreen extends HookConsumerWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(templateControllerProvider);

    ref.listen(templateEventProvider, (prev, next) {
      if (next == null) {
        return;
      }
      next.maybeWhen(
        orElse: () {},
      );

      ref.read(templateEventProvider.notifier).resetState();
    });

    void loadData() async {
      if (!context.mounted) {
        return;
      }

      await ref.read(templateEventProvider.notifier).loadData();
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        loadData();
      });
     
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('Screen Name')),
      body: Container(),
    );
  }
}

 */
