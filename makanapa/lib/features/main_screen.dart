import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';

class MainScreen extends HookWidget {
  const MainScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  void onTabTapped(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = navigationShell.currentIndex;
    final primaryColor = context.primary;
    final selectedColor = context.textPrimary;

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: navigationShell),
          Divider(color: AppColor.disabledColor()),
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
