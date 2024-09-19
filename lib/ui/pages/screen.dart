import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';
import 'package:wizard_world/ui/widgets/ww_app_bar.dart';

class Screen extends StatelessWidget {
  final String title;
  final Widget Function(BuildContext context, WizardWorldState state) child;
  const Screen({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WizardWorldCubit, WizardWorldState>(
      bloc: sl.wizardWorld,
      builder: (context, state) {
        return Scaffold(
          appBar: WWAppBar(title: title),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: child(context, state),
          ),
        );
      },
    );
  }
}
