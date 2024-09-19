import 'package:flutter/material.dart';
import 'package:wizard_world/features/core/instance_injection.dart';

class WWAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const WWAppBar({super.key, required this.title });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    bool offstage = (sl.screenController.state.main.lastScreenStack?.length ?? 0) < 1;
    return AppBar(
      leading: offstage ? null : IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => sl.screenController.back()),
      title: Text(title, style: title.length > 10 ? theme.bodyMedium :  theme.titleLarge),
      centerTitle: true,
    );
  }
}
