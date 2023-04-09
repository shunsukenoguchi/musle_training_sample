import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:muscle_training/ui/pages/home/home_page.dart';
import 'package:muscle_training/ui/pages/setting/setting_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../utiles/bottom_nav_view_type.dart';

final baseTabHomeProvider =
    StateProvider<BottomNavViewType>((ref) => BottomNavViewType.home);
final baseTabSettingProvider =
    StateProvider<BottomNavViewType>((ref) => BottomNavViewType.setting);

class BaseBottomNav extends HookConsumerWidget {
  final int firstViewTypeIndex;
  BaseBottomNav({Key? key, required this.firstViewTypeIndex}) : super(key: key);

  final widgets = [
    const HomePage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BottomNavViewType view;
    StateController<BottomNavViewType> viewNotifier;
    if (firstViewTypeIndex == BottomNavViewType.home.index) {
      view = ref.watch(baseTabHomeProvider);
      viewNotifier = ref.read(baseTabHomeProvider.notifier);
    } else {
      view = ref.watch(baseTabSettingProvider);
      viewNotifier = ref.read(baseTabSettingProvider.notifier);
    }

    return Scaffold(
      body: widgets[view.index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
        ],
        currentIndex: viewNotifier.state.index,
        onTap: (int index) {
          viewNotifier.update((state) => BottomNavViewType.values[index]);
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
