import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/dialog_helper.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/profile/presentation/changePassword/components/change_password_btn.dart';
import 'package:makanapa/features/profile/presentation/changePassword/components/change_password_widget.dart';
import 'package:makanapa/features/profile/presentation/changePassword/controllers/change_password_controller.dart';
import 'package:makanapa/features/profile/presentation/changePassword/controllers/state/change_password_event_state.dart';

class ChangePasswordScreen extends HookConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showLogoutDialog() {
      DialogHelper.show(
        context: context,
        title: "Perhatian",
        content: "Password berhasil diubah, silahkan login ulang untuk dicoba",
        hideCloseBtn: true,
        onButtonPress: (buttonState) {
          switch (buttonState) {
            case DialogButtonType.primary:
              {
                ref.read(changePasswordControllerProvider.notifier).logout();
              }
            case _:
              {}
          }
        },
      );
    }

    final showLoading = ref.watch(
      changePasswordControllerProvider.select((s) => s.showProcessLoading),
    );

    useEffect(() {
      final sub = ref
          .read(changePasswordControllerProvider.notifier)
          .events
          .listen((event) {
            event.maybeWhen(
              toastError: (messgae) {
                SnackBarHelper.showError(context, messgae);
              },
              showLogoutDialog: () {
                showLogoutDialog();
              },
              orElse: () {},
            );
          });

      return sub.cancel; // Dispose subscription
    }, const []);

    Widget mainBody() {
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [Dimens.lg.space, const ChangePasswordWidget()],
                ),
              ),
            ),
          ),
          const ChangePasswordBtn(),
        ],
      ).paddingAll(Dimens.lg);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Ubah Password')),
      resizeToAvoidBottomInset: false,
      body: ScreenContent<String>(
        state: Success(""),
        overlayLoading: showLoading,
        successWidget: (data) {
          return SafeArea(child: mainBody());
        },
      ),
    );
  }
}
