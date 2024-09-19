part of 'screen_controller_cubit.dart';

/// Holds the main state of the screen controller, including the current screen and navigation stack.
class MainScreenControllerState extends Equatable {
  /// An optional message associated with the state.
  final String? message;

  /// The current screen being displayed.
  final Screen currentScreen;

  /// A stack of previously visited screens.
  final List<Screen>? lastScreenStack;

  /// Creates an instance of [MainScreenControllerState].
  ///
  /// The [currentScreen] defaults to [Screen.landing].
  const MainScreenControllerState({
    this.message,
    this.currentScreen = Screen.landing,
    this.lastScreenStack,
  });

  @override
  List<Object?> get props => [
    message,
    currentScreen,
    lastScreenStack,
  ];

  /// Returns a copy of this state with the given fields replaced by new values.
  MainScreenControllerState copyWith({
    String? message,
    Screen? currentScreen,
    List<Screen>? lastScreenStack,
  }) {
    return MainScreenControllerState(
      message: message ?? this.message,
      currentScreen: currentScreen ?? this.currentScreen,
      lastScreenStack: lastScreenStack ?? this.lastScreenStack,
    );
  }
}

/// The base class for all screen controller states.
abstract class ScreenControllerState extends Equatable {
  /// The main state of the screen controller.
  final MainScreenControllerState main;

  /// Creates an instance of [ScreenControllerState].
  const ScreenControllerState(this.main);

  @override
  List<Object> get props => [main];
}

/// The initial state of the screen controller.
class SCInitial extends ScreenControllerState {
  /// Creates an instance of [SCInitial].
  const SCInitial() : super(const MainScreenControllerState());
}

/// The loading state of the screen controller.
class SCLoading extends ScreenControllerState {
  /// Creates an instance of [SCLoading].
  const SCLoading(super.main);
}

/// A state with a message in the screen controller.
class SCMessage extends ScreenControllerState {
  /// Creates an instance of [SCMessage].
  const SCMessage(super.main);
}

/// The loaded state of the screen controller.
class SCLoaded extends ScreenControllerState {
  /// Creates an instance of [SCLoaded].
  const SCLoaded(super.main);
}

/// An error state in the screen controller.
class SCError extends ScreenControllerState {
  /// The stack trace associated with the error.
  final String? stackTrace;

  /// Creates an instance of [SCError].
  ///
  /// Logs the error message and stack trace in debug mode.
  SCError(super.main, {this.stackTrace}) {
    if (kDebugMode) {
      log('ERROR: ${main.message}');
      log('STACK TRACE: $stackTrace');
    }
  }
}