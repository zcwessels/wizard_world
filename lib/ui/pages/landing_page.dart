import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/screen_controller/types/screen_types.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';
import 'package:wizard_world/ui/widgets/ww_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
    sl.wizardWorld.init();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return BlocBuilder<WizardWorldCubit, WizardWorldState>(
      bloc: sl.wizardWorld,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Lottie.asset('assets/lottie/hello_wizard.json', height: 200)),
              const SizedBox(height: 16),
              Text('Welcome to', style: theme.titleMedium),
              const SizedBox(height: 8),
              Text('Wizard World'.toUpperCase(), style: theme.displayLarge),
              const SizedBox(height: 16),
              WWButton(
                onTap: () => sl.screenController.go(Screen.home, addLastToStack: false),
                title: 'Get Started',
                isLoading: state.main.isLoading,
              )
            ],
          ),
        );
      }
    );
  }
}
