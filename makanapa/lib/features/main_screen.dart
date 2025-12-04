import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/features/recipe/presentation/list/components/filter_recipe_bottomsheet_widget.dart';
import 'package:makanapa/features/shared/main/main_controller.dart';
import 'package:makanapa/features/shared/main/state/main_event.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  void onTabTapped(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainControllerProvider);

    void openBottomSheet(String? selectedValue) async {
      final String? selectedItem = await showModalBottomSheet<String>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return FilterRecipeBottomsheet(currentSelection: selectedValue);
        },
      );

      // 5. Update state (selectedValue) and controller
      if (selectedItem != null) {
        ref
            .read(mainControllerProvider.notifier)
            .onTypeBottomSheetResult(selectedItem);
      }
    }

    useEffect(() {
      final subz = ref.read(mainControllerProvider.notifier).events.listen((
        event,
      ) {
        event.maybeWhen(
          openTypeBottomSheet: (type) {
            openBottomSheet(type);
          },
          orElse: () {},
        );
      });

      return subz.cancel; // Dispose subscription
    }, const []);

    final selectedIndex = navigationShell.currentIndex;
    final primaryColor = context.primary;
    final selectedColor = context.textPrimary;

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: navigationShell),
          Divider(height: 1, color: AppColor.disabledColor()),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStateTextStyle.resolveWith((
            Set<WidgetState> states,
          ) {
            final textStyles = states.contains(WidgetState.selected)
                ? TextStyle(color: selectedColor, fontWeight: FontWeight.bold)
                : TextStyle(color: primaryColor, fontWeight: FontWeight.normal);
            return textStyles;
          }),
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onTabTapped,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: primaryColor),
              selectedIcon: Icon(Icons.home, color: selectedColor),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined, color: primaryColor),
              selectedIcon: Icon(Icons.book, color: selectedColor),
              label: 'Resep',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined, color: primaryColor),
              selectedIcon: Icon(Icons.shopping_cart, color: selectedColor),
              label: 'Bahan',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline, color: primaryColor),
              selectedIcon: Icon(Icons.person, color: selectedColor),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
