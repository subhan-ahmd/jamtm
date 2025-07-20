import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jamtm/utils/color_manager.dart';
import 'package:jamtm/widgets/basic_scaffold/providers/current_tab_provider.dart';

class BasicScaffold extends ConsumerWidget {
  final List<NavigationDestination> destinations;
  final List<Widget> screens;
  const BasicScaffold({
    super.key,
    this.destinations = const [],
    this.screens = const [],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(currentTabProvider);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: ColorManager.white,
        onDestinationSelected: (int index) {
          ref.read(currentTabProvider.notifier).toggle(index);
        },
        selectedIndex: currentTab,
        destinations: destinations,
      ),
      body: screens[currentTab],
    );
  }
}
