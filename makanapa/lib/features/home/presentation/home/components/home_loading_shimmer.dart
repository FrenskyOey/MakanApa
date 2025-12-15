import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeLoadingShimmerWidget extends HookConsumerWidget {
  const HomeLoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Dimens.md, 0, Dimens.md, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dimens.md.space,
                  Text("Selamat Datang,  User", style: context.titleLarge),
                  Dimens.ms.space,
                  Text("Menu Makan Minggu Ini", style: context.titleMedium),
                  Dimens.md.space,
                ],
              ),
            ),

            Row(
              children: List.generate(7, (index) => const _DateSkeletonItem()),
            ),
            Dimens.md.space,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.ms),
              child: Skeleton.leaf(
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Dimens.lg.space,
            Padding(
              padding: const EdgeInsets.fromLTRB(Dimens.md, 0, Dimens.md, 0),
              child: Text("Daftar Menu Yang Akan", style: context.titleLarge),
            ),
            Dimens.md.space,
            Padding(
              padding: const EdgeInsets.fromLTRB(Dimens.md, 0, Dimens.md, 0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: Dimens.md,
                  mainAxisSpacing: Dimens.md,
                ),
                itemBuilder: (context, index) {
                  return Skeleton.leaf(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // The Bone.icon is just a placeholder to give the shimmer some texture
                            child: Bone.square(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateSkeletonItem extends StatelessWidget {
  const _DateSkeletonItem();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.xs),
        child: Skeleton.leaf(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
