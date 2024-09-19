library instance_injection;

import 'package:get_it/get_it.dart';
import 'package:wizard_world/features/cubits/screen_controller/screen_controller_cubit.dart';
import 'package:wizard_world/features/cubits/wizard_world/wizard_world_cubit.dart';

/// A global instance of the [GetIt] service locator.
final GetIt sl = GetIt.instance;

/// Initializes instance injections for the application.
class InstanceInjection {
  /// Initializes instance injections by registering cubits with the service locator.
  static Future<void> init() async {
    sl.lazyRegisterCubit(() => ScreenControllerCubit());
    sl.registerCubit(() => WizardWorldCubit());
  }
}

/// Extends [GetIt] with methods for cubit registration and retrieval.
extension InstanceInjectionExtension on GetIt {
  /// The [WizardWorldCubit] instance from the service locator.
  WizardWorldCubit get wizardWorld => this<WizardWorldCubit>();

  /// The [ScreenControllerCubit] instance from the service locator.
  ScreenControllerCubit get screenController => this<ScreenControllerCubit>();

  /// Registers a cubit of type [T] as a lazy singleton if not already registered.
  ///
  /// The [cubit] parameter is a function that returns an instance of the cubit to be registered.
  void lazyRegisterCubit<T extends Object>(T Function() cubit) {
    if (!this.isRegistered<T>()) {
      this.registerLazySingleton<T>(cubit);
    }
  }

  /// Registers a cubit of type [T] as a singleton if not already registered.
  ///
  /// The [cubit] parameter is a function that returns an instance of the cubit to be registered.
  void registerCubit<T extends Object>(T Function() cubit) {
    if (!this.isRegistered<T>()) {
      this.registerSingleton<T>(cubit());
    }
  }
}