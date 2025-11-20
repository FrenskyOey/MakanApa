import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/constants/channel_constant.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/bottomSheet/image_picker_bottomsheet.dart';
import 'package:makanapa/core/widgets/image/avatar_image.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/profile/presentation/profileEdit/components/edit_profile_btn.dart';
import 'package:makanapa/features/profile/presentation/profileEdit/components/edit_profile_form_widget.dart';
import 'package:makanapa/features/profile/presentation/profileEdit/controllers/profile_edit_controller.dart';
import 'package:makanapa/features/profile/presentation/profileEdit/controllers/state/profile_edit_event_state.dart';

class ProfileEditScreen extends HookConsumerWidget {
  final UserData userData;
  const ProfileEditScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const MethodChannel platformChannel = MethodChannel(nativeImageChannel);

    final showLoading = ref.watch(
      profileEditControllerProvider.select((s) => s.showProgress),
    );

    final avatar = ref.watch(
      profileEditControllerProvider.select((s) => (s.avatarFiles)),
    );

    void openCamera() async {
      try {
        // 3. Invoke the method on the native platform.
        final String? result = await platformChannel.invokeMethod('openCamera');
        ref.read(profileEditControllerProvider.notifier).uploadPicture(result);
      } on PlatformException catch (e) {
        if (context.mounted) {
          SnackBarHelper.showError(context, e.message ?? "");
        }
      }
    }

    void openGallery() async {
      try {
        // 3. Invoke the method on the native platform.
        final String? result = await platformChannel.invokeMethod(
          'openGallery',
        );
        ref.read(profileEditControllerProvider.notifier).uploadPicture(result);
      } on PlatformException catch (e) {
        if (context.mounted) {
          SnackBarHelper.showError(context, e.message ?? "");
        }
      }
    }

    ref.listen(
      profileEditControllerProvider.select((value) => value.eventState),
      (prev, next) {
        next.maybeWhen(
          toastError: (message) {
            SnackBarHelper.showError(context, message);
          },
          openGallery: () {
            ImagePickerBottomSheet.show(
              context: context,
              onCameraPick: () {
                openCamera();
              },
              onGalleryPick: () {
                openGallery();
              },
            );
          },
          successUpdate: (user) {
            context.pop(user);
          },
          orElse: () {},
        );

        ref.read(profileEditControllerProvider.notifier).resetEventState();
      },
    );

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(profileEditControllerProvider.notifier).loadUserData(userData);
      });
      return null;
    }, []);

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
                  children: [
                    Dimens.lg.space,
                    Center(
                      child: InkWell(
                        onTap: () {
                          ref
                              .read(profileEditControllerProvider.notifier)
                              .openGallery();
                        },

                        //borderRadius: BorderRadius.circular(radius),
                        customBorder: const CircleBorder(),

                        child: AvatarImage(
                          src: avatar,
                          name: userData.name,
                          size: AvatarSize.xlarge,
                        ).paddingAll(Dimens.sm),
                      ),
                    ),
                    Dimens.lg.space,
                    EditProfileFormWidget(userData: userData),
                  ],
                ),
              ),
            ),
          ),
          const EditProfileBtn(),
        ],
      ).paddingAll(Dimens.lg);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Ubah Profil')),
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
