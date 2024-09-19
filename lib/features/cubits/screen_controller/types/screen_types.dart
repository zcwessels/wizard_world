library screen_extension;

import 'package:flutter/material.dart';
import 'package:wizard_world/ui/pages/coming_soon.dart';
import 'package:wizard_world/ui/pages/elixirs/elixir_main.dart';
import 'package:wizard_world/ui/pages/home_page.dart';
import 'package:wizard_world/ui/pages/houses/houses_main.dart';
import 'package:wizard_world/ui/pages/landing_page.dart';
import 'package:wizard_world/ui/pages/spells/spells_main.dart';
import 'package:wizard_world/ui/pages/wizards/wizards_main.dart';

/// The different screens available in the application.
enum Screen {
  landing,
  home,
  wizards,
  elixirs,
  spells,
  houses,
}

/// Adds utility methods to the [Screen] enum.
extension ScreenExtension on Screen {
  /// Returns the [Widget] associated with this [Screen].
  ///
  /// If no specific screen is matched, defaults to the [ComingSoon] view.
  Widget get view {
    switch (this) {
      case Screen.landing:
        return const LandingPage();
      case Screen.home:
        return const HomePage();
      case Screen.wizards:
        return const WizardsMain();
      case Screen.elixirs:
        return const ElixirMain();
      case Screen.houses:
        return const HousesMain();
      case Screen.spells:
        return const SpellsMain();
      default:
        return const ComingSoon();
    }
  }
}