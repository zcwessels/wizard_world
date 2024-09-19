import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/screen_controller/screen_controller_cubit.dart';
import 'package:wizard_world/features/cubits/screen_controller/types/screen_types.dart';
import 'package:wizard_world/features/cubits/wizard_world/types/battle_file.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';


void main() {
  setUp(() async => await InstanceInjection.init());
  tearDown(() => sl.reset());

  blocTest<WizardWorldCubit, WizardWorldState>(
    'emits the correct states when initializing the wizard world cubit',
    build: () => sl.wizardWorld,
    act: (cubit) => cubit.init(),
    expect: () => [
      WWLoading(const MainWizardWorldState(isLoading: true)),
      isA<WWLoaded>()
          .having((state) => state.main.isLoading, 'isLoading', false)
          .having((state) => state.main.houses, 'houses', isA<List<WWHouse>>())
          .having((state) => state.main.spells, 'spells', isA<List<WWSpell>>())
          .having((state) => state.main.wizards, 'wizards', isA<List<WWWizard>>()),
    ],
  );

  blocTest<ScreenControllerCubit, ScreenControllerState>(
    'emits the correct states when navigating to the home screen',
    build: () => sl.screenController,
    act: (cubit) => cubit.go(Screen.home),
    expect: () => [
      const SCMessage(MainScreenControllerState(currentScreen: Screen.landing)),
      const SCLoaded(MainScreenControllerState(currentScreen: Screen.home, lastScreenStack: [Screen.landing])),
    ],
  );
}