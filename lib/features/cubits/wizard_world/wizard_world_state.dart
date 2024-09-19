part of 'wizard_world_cubit.dart';

/// An enumeration representing the different tiles in the Wizard World feature.
enum WWTiles { houses, spells, wizards, elixirs }

/// An extension on [WWTiles] to provide additional functionality.
extension WWTypeExtension on WWTiles {
  /// Returns the asset path associated with the tile.
  String get asset {
    switch (this) {
      case WWTiles.houses:
        return 'assets/images/houses.png';
      case WWTiles.spells:
        return 'assets/images/spells.png';
      case WWTiles.wizards:
        return 'assets/images/wizard.png';
      case WWTiles.elixirs:
        return 'assets/images/elixir.png';
    }
  }
}

/// A class representing the main state of the Wizard World feature.
///
/// This class extends [Equatable] to provide value equality.
class MainWizardWorldState extends Equatable {
  /// The message associated with the state.
  final String? message;

  /// Indicates whether the state is currently loading.
  final bool isLoading;

  /// The currently selected tile.
  final WWTiles? selectedTile;

  /// The currently selected house.
  final WWHouse? selectedHouse;

  /// The currently selected spell.
  final WWSpell? selectedSpell;

  /// The currently selected wizard.
  final WWWizard? selectedWizard;

  /// The currently selected elixir.
  final WWElixir? selectedElixir;

  /// The list of houses.
  final List<WWHouse>? houses;

  /// The list of spells.
  final List<WWSpell>? spells;

  /// The list of wizards.
  final List<WWWizard>? wizards;

  /// The list of elixirs.
  final List<WWElixir>? elixirs;

  /// The list of filtered houses based on a search query.
  final List<WWHouse>? filteredHouses;

  /// The list of filtered spells based on a search query.
  final List<WWSpell>? filteredSpells;

  /// The list of filtered wizards based on a search query.
  final List<WWWizard>? filteredWizards;

  /// The list of filtered elixirs based on a search query.
  final List<WWElixir>? filteredElixirs;

  /// Creates a new [MainWizardWorldState] instance.
  ///
  /// All fields are optional and have default values.
  const MainWizardWorldState({
    this.message,
    this.isLoading = false,
    this.selectedTile,
    this.houses,
    this.spells,
    this.wizards,
    this.elixirs,
    this.selectedHouse,
    this.selectedSpell,
    this.selectedWizard,
    this.selectedElixir,
    this.filteredHouses,
    this.filteredSpells,
    this.filteredWizards,
    this.filteredElixirs,
  });

  @override
  List<Object?> get props => [
        message,
        selectedTile,
        houses,
        spells,
        wizards,
        elixirs,
        selectedHouse,
        selectedSpell,
        selectedWizard,
        selectedElixir,
        isLoading,
        filteredHouses,
        filteredSpells,
        filteredWizards,
        filteredElixirs,
      ];

  /// Creates a copy of this [MainWizardWorldState] but with the given fields replaced with the new values.
  ///
  /// If a field is not provided, the current value of the field is used.
  MainWizardWorldState copyWith({
    String? message,
    WWTiles? selectedTile,
    WWHouse? selectedHouse,
    WWSpell? selectedSpell,
    WWWizard? selectedWizard,
    WWElixir? selectedElixir,
    bool? isLoading,
    List<WWHouse>? houses,
    List<WWSpell>? spells,
    List<WWWizard>? wizards,
    List<WWElixir>? elixirs,
    List<WWHouse>? filteredHouses,
    List<WWSpell>? filteredSpells,
    List<WWWizard>? filteredWizards,
    List<WWElixir>? filteredElixirs,
    bool copyWithNull = false,
  }) {
    return MainWizardWorldState(
      message: message ?? this.message,
      selectedTile: selectedTile ?? this.selectedTile,
      houses: houses ?? this.houses,
      spells: spells ?? this.spells,
      wizards: wizards ?? this.wizards,
      elixirs: elixirs ?? this.elixirs,
      isLoading: isLoading ?? this.isLoading,
      selectedHouse: selectedHouse ?? this.selectedHouse,
      selectedSpell: selectedSpell ?? this.selectedSpell,
      selectedWizard: selectedWizard ?? this.selectedWizard,
      selectedElixir: selectedElixir ?? this.selectedElixir,
      filteredHouses: copyWithNull ? null : filteredHouses ?? this.filteredHouses,
      filteredSpells: copyWithNull ? null : filteredSpells ?? this.filteredSpells,
      filteredWizards: copyWithNull ? null : filteredWizards ?? this.filteredWizards,
      filteredElixirs: copyWithNull ? null : filteredElixirs ?? this.filteredElixirs,
    );
  }
}

/// An abstract class representing the state of the Wizard World feature.
///
/// This class extends [Equatable] to provide value equality.
abstract class WizardWorldState extends Equatable {
  /// The main state of the Wizard World feature.
  final MainWizardWorldState main;

  /// Creates a new [WizardWorldState] instance.
  const WizardWorldState(this.main);

  /// Searches for wizards based on the [query] and returns the filtered results.
  List<WWWizard> searchWizards(String query) {
    return main.wizards?.where((wizard) => wizard.firstName.toLowerCase().contains(query.toLowerCase()) || wizard.lastName.toLowerCase().contains(query.toLowerCase())).toList() ?? [];
  }

  /// Searches for houses based on the [query] and returns the filtered results.
  List<WWHouse> searchHouses(String query) {
    return main.houses?.where((house) => house.name.toLowerCase().contains(query.toLowerCase())).toList() ?? [];
  }

  /// Searches for spells based on the [query] and returns the filtered results.
  List<WWSpell> searchSpells(String query) {
    return main.spells?.where((spell) => spell.name.toLowerCase().contains(query.toLowerCase())).toList() ?? [];
  }

  /// Searches for elixirs based on the [query] and returns the filtered results.
  List<WWElixir> searchElixirs(String query) {
    return main.elixirs?.where((elixir) => elixir.name.toLowerCase().contains(query.toLowerCase())).toList() ?? [];
  }

  @override
  List<Object> get props => [main];
}

/// A class representing the initial state of the Wizard World feature.
class WWInitial extends WizardWorldState {
  /// Creates a new [WWInitial] instance.
  const WWInitial() : super(const MainWizardWorldState());
}

/// A class representing the loading state of the Wizard World feature.
class WWLoading extends WizardWorldState {
  /// Creates a new [WWLoading] instance.
  ///
  /// The [main] state is copied with the loading flag set to true.
  WWLoading(MainWizardWorldState main) : super(main.copyWith(isLoading: true));
}

/// A class representing a message state in the Wizard World feature.
class WWMessage extends WizardWorldState {
  /// Creates a new [WWMessage] instance.
  const WWMessage(super.main);
}

/// A class representing the loaded state of the Wizard World feature.
///
/// This state can optionally show a bottom sheet.
class WWLoaded extends WizardWorldState {
  /// Indicates whether to show the bottom sheet.
  final bool showBottomSheet;

  /// Creates a new [WWLoaded] instance.
  ///
  /// The [main] state is copied with the loading flag set to false.
  WWLoaded(MainWizardWorldState main, {this.showBottomSheet = false}) : super(main.copyWith(isLoading: false));
}

/// A class representing the error state of the Wizard World feature.
///
/// This state includes an optional stack trace for debugging purposes.
class WWError extends WizardWorldState {
  /// The stack trace associated with the error.
  final String? stackTrace;

  /// Creates a new [WWError] instance.
  WWError(super.main, {this.stackTrace}) {
    if (kDebugMode) {
      log('ERROR: ${main.message}');
      log('ERROR: $stackTrace');
    }
  }
}