import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/profile/presentation/profileEdit/controllers/profile_edit_controller.dart';

class EditProfileFormWidget extends HookConsumerWidget {
  final UserData userData;

  const EditProfileFormWidget({super.key, required this.userData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (errorName, errorPhone) = ref.watch(
      profileEditControllerProvider.select(
        (value) => (value.errorName, value.errorPhone),
      ),
    );

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        nameController.text = userData.name;
        phoneController.text = userData.phone ?? "";
      });
      return null;
    }, []);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              Dimens.lg.space,
              TextFormField(
                controller: nameController,
                // initialValue: userData.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: AppColor.primary),
                  labelText: 'Nama User',
                  hintText: 'Masukkan nama anda',
                  errorText: errorName.isNotEmpty ? errorName : null,
                ),

                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (input) {
                  ref
                      .read(profileEditControllerProvider.notifier)
                      .isUserNameValid(input);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Dimens.xl.space,
              TextFormField(
                controller: phoneController,
                // initialValue: userData.phone ?? "",
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: AppColor.primary,
                  ),
                  labelText: 'Telepon',
                  hintText: 'Masukkan Nomor Telepon',
                  errorText: errorPhone.isNotEmpty ? errorPhone : null,
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                onChanged: (input) {
                  ref
                      .read(profileEditControllerProvider.notifier)
                      .isPhoneNumberValid(input);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
