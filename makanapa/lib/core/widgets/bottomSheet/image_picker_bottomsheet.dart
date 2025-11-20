import 'package:flutter/material.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/OptionItem.dart';
import 'package:makanapa/core/widgets/option_widget.dart';

class ImagePickerBottomSheet {
  static void show({
    required BuildContext context,
    required VoidCallback onCameraPick,
    required VoidCallback onGalleryPick,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Dimens.lg)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(Dimens.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Pilih metode pengambilan gambar",
                  style: context.titleMedium,
                  textAlign: TextAlign.center,
                ),
                Dimens.md.space,
                OptionWidget(
                  item: OptionItem(
                    icon: Icons.camera_alt,
                    title: "Kamera",
                    subtitle: "Ambil gambar dengan kamera",
                    color: Colors.green.shade400,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    onCameraPick();
                  },
                ),
                OptionWidget(
                  item: OptionItem(
                    icon: Icons.photo_library,
                    title: "Gallery",
                    subtitle: "Ambil gambar dengan gallery",
                    color: Colors.green.shade700,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    onGalleryPick();
                  },
                ),
                OptionWidget(
                  item: OptionItem(
                    icon: Icons.cancel,
                    title: "Cancel",
                    subtitle: "",
                    color: Colors.green.shade900,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Dimens.md.space,
              ],
            ),
          ),
        );
      },
    );
  }
}
