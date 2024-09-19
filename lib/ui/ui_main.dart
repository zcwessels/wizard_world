import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_world/features/core/constants.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/screen_controller/screen_controller_cubit.dart';
import 'package:wizard_world/features/cubits/screen_controller/types/screen_types.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';
import 'package:wizard_world/ui/pages/houses/house_details.dart';
import 'package:wizard_world/ui/widgets/ww_custom_snackbar.dart';

import 'pages/elixirs/elixir_details.dart';
import 'pages/spells/spell_details.dart';
import 'pages/wizards/wizard_details.dart';

class UIMain extends StatelessWidget {
  const UIMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 48, fontFamily: "Harry"),
            titleLarge: TextStyle(fontSize: 32, fontFamily: "Harry"),
            titleMedium: TextStyle(fontSize: 16),
            titleSmall: TextStyle(fontSize: 14),
            bodyLarge: TextStyle(fontSize: 12),
            bodyMedium: TextStyle(fontSize: 24, fontFamily: "Harry"),
            bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )),
      home: PopScope(
        // PopScope is broken in this version of the Flutter SDK
        canPop: false,
        child: BlocListener<WizardWorldCubit, WizardWorldState>(
          bloc: sl.wizardWorld,
          listener: (context, state) {
            if (state is WWLoaded && state.showBottomSheet) {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  Widget child = const SizedBox();
                  switch (state.main.selectedTile) {
                    case WWTiles.wizards:
                      child = const WizardDetails();
                    case WWTiles.elixirs:
                      child = const ElixirDetails();
                    case WWTiles.houses:
                      child = const HouseDetails();
                    case WWTiles.spells:
                      child = const SpellDetails();
                    case null:
                      child = const SizedBox();
                  }
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: child,
                  );
                },
              );
            }

            if (state is WWError) WWCustomSnackBar(message: state.main.message ?? "Unknown Error", fieldColor: Colors.red).show(context);
          },
          child: BlocBuilder<ScreenControllerCubit, ScreenControllerState>(
            bloc: sl.screenController,
            builder: (context, state) => GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  sl.screenController.back();
                }
              },
              child: state.main.currentScreen.view,
            ),
          ),
        ),
      ),
    );
  }
}
