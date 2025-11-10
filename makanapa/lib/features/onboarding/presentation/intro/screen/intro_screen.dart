import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void handleLoginEvent() {
      //context.goNamed(RouteNames.login);
      SnackBarHelper.showError(context, "Belum Ready");
    }

    void handleSignUpEvent() {
      //context.pushNamed(RouteNames.signUp);
      SnackBarHelper.showError(context, "Belum Ready");
    }

    final decorator = PageDecoration(
      titleTextStyle: context.textTheme.titleLarge!,
      bodyTextStyle: context.textTheme.bodyMedium!,
    );

    Widget introWidget() {
      return IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Masak Jadi Lebih Mudah',
            body:
                'Temukan ide masakan yang praktis dan sesuai seleramu setiap hari. Mulai dari makanan rumahan sampai menu spesial, semua ada di sini.',
            image: Image.asset(
              "assets/images/intro2.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            decoration: decorator,
          ),
          PageViewModel(
            title: 'Belanja Jadi Terencana',
            body:
                'Buat daftar belanja otomatis dari menu yang kamu pilih. Belanja jadi lebih hemat waktu dan nggak ada bahan yang terlupa lagi.',
            image: Image.asset(
              "assets/images/intro1.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            decoration: decorator,
          ),
          PageViewModel(
            title: 'Atur Menu Mingguanmu',
            body:
                'Rencanakan makanan seminggu ke depan biar nggak bingung setiap hari. Dengan rencana yang tepat, hidup jadi lebih hemat dan sehat.',
            image: Image.asset(
              "assets/images/intro3.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            decoration: decorator,
          ),
          PageViewModel(
            title: 'Nikmati Hasilnya',
            body:
                'Masak mudah, makan puas tanpa pusing memikirkan “Makan apa?”. Sekarang kamu bisa menikmati makanan favorit dengan lebih teratur.',
            image: Image.asset(
              "assets/images/intro4.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            decoration: decorator,
          ),
        ],
        showNextButton: false,
        showDoneButton: false,
        showSkipButton: false,
        infiniteAutoScroll: true,
        autoScrollDuration: 3000,
        dotsDecorator: DotsDecorator(activeColor: AppColor.primary),
      );
    }

    Widget btnLayout() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: handleSignUpEvent,
              child: const Text('Daftar'),
            ),
          ),
          Dimens.lg.space,
          //Expanded(child: const SizedBox()),
          Expanded(
            child: ElevatedButton(
              onPressed: handleLoginEvent,
              child: const Text('Masuk'),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Dimens.lg.space,
            Expanded(child: introWidget()),
            Dimens.md.space,
            btnLayout(),
            Dimens.sm.space,
          ],
        ).paddingHorizontal(Dimens.md),
      ),
    );
  }
}
