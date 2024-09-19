library screen_controller_cubit;

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wizard_world/features/cubits/screen_controller/types/screen_types.dart';

part 'screen_controller_state.dart';

/// Manages navigation between screens in the application.
class ScreenControllerCubit extends Cubit<ScreenControllerState> {
  /// Creates an instance of [ScreenControllerCubit] with an initial state.
  ScreenControllerCubit() : super(const SCInitial());

  /// Navigates to the given [screen].
  ///
  /// If [addLastToStack] is `true` (the default), the current screen is added to the stack of previous screens.
  void go(Screen screen, {bool addLastToStack = true, bool copyWithNull = false}) {
    try {
      emit(SCMessage(state.main));
      List<Screen> lastScreenStack = List.from(state.main.lastScreenStack ?? []);
      if (addLastToStack) lastScreenStack.add(state.main.currentScreen);
      emit(SCLoaded(state.main.copyWith(
        currentScreen: screen,
        lastScreenStack: lastScreenStack,
      )));
    } catch (e, s) {
      emit(SCError(state.main, stackTrace: s.toString()));
    }
  }

  /// Navigates back to the previous screen.
  void back() {
    try {
      List<Screen> lastScreenStack = List.from(state.main.lastScreenStack ?? []);
      if (lastScreenStack.isNotEmpty) {
        lastScreenStack.removeLast();
      }
      Screen previousScreen = lastScreenStack.isEmpty ? Screen.home : lastScreenStack.last;
      emit(SCLoaded(state.main.copyWith(
        currentScreen: previousScreen,
        lastScreenStack: lastScreenStack,
      )));
    } catch (e, s) {
      emit(SCError(state.main.copyWith(message: e.toString()), stackTrace: s.toString()));
    }
  }
}
