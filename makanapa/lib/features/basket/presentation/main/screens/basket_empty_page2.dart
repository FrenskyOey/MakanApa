import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';

class BasketEmptyWidget2 extends StatelessWidget {
  const BasketEmptyWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 230,
              child: Image.asset(
                "assets/images/empty_mascots.png",
                fit: BoxFit.fitWidth,
              ).paddingAll(Dimens.md),
            ),

            Text(
              "Data rencana kosong",
              style: context.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            Text(
              "Sepertinya kamu belum membuat rencana diminggu depan, Coba buat rencana yang baru di halaman dashboard",
              style: context.bodyMedium,
              textAlign: TextAlign.center,
            ),
            Dimens.lg.space,
            ElevatedButton(
              onPressed: () {
                context.goNamed(RouteNames.home);
              },
              child: Text("Pergi ke Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
