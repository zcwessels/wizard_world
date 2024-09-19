import 'package:flutter/material.dart';
import 'package:wizard_world/features/core/constants.dart';
import 'package:wizard_world/ui/widgets/ww_app_bar.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const WWAppBar(title: AppConstants.appTitle),
      body: Center(child: Text('Coming soon...', style: theme.titleLarge)),
    );
  }
}
