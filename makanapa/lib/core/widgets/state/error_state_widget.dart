import 'package:flutter/material.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';

class ErrorStateWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const ErrorStateWidget({
    super.key,
    this.imagePath = "assets/images/error.png",
    this.title = "Error",
    this.subtitle = "Please try again latter",
    this.buttonText = "Retry",
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: Dimens.xxxl),
            Text(
              title,
              style: context.titleMedium,
              textAlign: TextAlign.center,
            ),
            Dimens.sm.space,
            Text(
              subtitle,
              style: context.bodyMedium,
              textAlign: TextAlign.center,
            ),
            Dimens.md.space,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onButtonPressed,
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
