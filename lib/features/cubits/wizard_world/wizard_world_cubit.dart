import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:string_similarity/string_similarity.dart';
import 'package:wizard_world/features/core/instance_injection.dart';
import 'package:wizard_world/features/cubits/screen_controller/types/screen_types.dart';
import 'types/battle_file.dart';

part 'wizard_world_state.dart';

/// A Cubit that manages the state of the Wizard World feature.
class WizardWorldCubit extends Cubit<WizardWorldState> {
  /// The base URL for the Wizard World API.
  final String _baseUrl = 'https://wizard-world-api.herokuapp.com/';

  /// The headers to be used in HTTP requests.
  final Map<String, String> headers = {"accept": "text/plain"};

  /// Creates a new [WizardWorldCubit] instance.
  WizardWorldCubit() : super(const WWInitial());

  /// Sends a GET request to the specified [endpoint].
  ///
  /// If [headers] are provided, they will be included in the request.
  ///
  /// Returns the decoded JSON response if the request is successful.
  ///
  /// Emits a [WWError] state if the request fails.
  dynamic _get(String endpoint, {Map<String, String>? headers}) async {
    try {
      Uri uri = Uri.parse('$_baseUrl$endpoint');
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) return jsonDecode(response.body);
      throw Exception('Failed to fetch data ${response.statusCode}');
    } catch (e, s) {
      emit(WWError(state.main.copyWith(message: (e as dynamic).message.toString()), stackTrace: s.toString()));
    }
  }

  /// Initializes the Wizard World data by fetching houses, spells, wizards, and elixirs.
  ///
  /// Emits a [WWLoading] state while fetching data.
  ///
  /// Emits a [WWLoaded] state with the fetched data if successful.
  ///
  /// Emits a [WWError] state if any request fails.
  void init() async {
    try {
      emit(WWLoading(state.main));
      List<Future> requests = <Future>[];
      requests.add(_get("Houses", headers: headers));
      requests.add(_get("Spells", headers: headers));
      requests.add(_get("Wizards", headers: headers));
      requests.add(_get("Elixirs", headers: headers));

      List<dynamic> responses = await Future.wait(requests);

      List<WWHouse> houses = responses[0]?.map<WWHouse>((house) => WWHouse.fromMap(house)).toList() ?? [];
      List<WWSpell> spells = responses[1]?.map<WWSpell>((spell) => WWSpell.fromMap(spell)).toList() ?? [];
      List<WWWizard> wizards = responses[2]?.map<WWWizard>((wizard) => WWWizard.fromMap(wizard)).toList() ?? [];
      List<WWElixir> elixirs = responses[3]?.map<WWElixir>((elixir) => WWElixir.fromMap(elixir)).toList() ?? [];

      emit(WWLoaded(state.main.copyWith(houses: houses, spells: spells, wizards: wizards, elixirs: elixirs)));
    } catch (e, s) {
      emit(WWError(state.main.copyWith(message: (e as dynamic).message.toString()), stackTrace: s.toString()));
    }
  }

  /// Selects a tile and navigates to the corresponding screen.
  ///
  /// Emits a [WWMessage] state with the selected tile.
  ///
  /// Emits a [WWLoaded] state after navigation.
  ///
  /// Emits a [WWError] state if an error occurs.
  void selectTile(WWTiles tile) {
    try {
      emit(WWMessage(state.main.copyWith(selectedTile: tile)));
      switch (tile) {
        case WWTiles.houses:
          sl.screenController.go(Screen.houses);
        case WWTiles.spells:
          sl.screenController.go(Screen.spells);
        case WWTiles.wizards:
          sl.screenController.go(Screen.wizards);
        case WWTiles.elixirs:
          sl.screenController.go(Screen.elixirs);
      }
      emit(WWLoaded(state.main));
    } catch (e, s) {
      emit(WWError(state.main.copyWith(message: (e as dynamic).message.toString()), stackTrace: s.toString()));
    }
  }

  /// Selects a wizard and shows the bottom sheet with the wizard details.
  ///
  /// Emits a [WWLoading] state while processing.
  ///
  /// Emits a [WWLoaded] state with the selected wizard and shows the bottom sheet.
  ///
  /// Emits a [WWError] state if an error occurs.
  void selectWizard(WWWizard wizard) {
    try {
      emit(WWLoading(state.main));
      emit(WWLoaded(state.main.copyWith(selectedWizard: wizard, selectedTile: WWTiles.wizards), showBottomSheet: true));
    } catch (e, s) {
      emit(WWError(state.main.copyWith(message: (e as dynamic).message.toString()), stackTrace: s.toString()));
    }
  }

  /// Selects an elixir by its [id] and shows the bottom sheet with the elixir details.
  ///
  /// Emits a [WWLoading] state while processing.
  ///
  /// Emits a [WWLoaded] state with the selected elixir and shows the bottom sheet.
  ///
  /// Emits a [WWError] state if an error occurs.
  void selectElixir(String id) {
    try {
      emit(WWLoading(state.main));
      WWElixir? elixir = state.main.elixirs?.firstWhere((e) => e.id == id);
      emit(WWLoaded(state.main.copyWith(selectedElixir: elixir, selectedTile: WWTiles.elixirs), showBottomSheet: true));
    } catch (e, s) {
      emit(WWError(state.main.copyWith(message: (e as dynamic).message.toString()), stackTrace: s.toString()));
    }
  }

  /// Selects a house and shows the bottom sheet with the house details.
  ///
  /// Emits a [WWLoading] state while processing.
  ///
  /// Emits a [WWLoaded] state with the selected house and shows the bottom sheet.
  ///
  /// Emits a [WWError] state if an error occurs.
  void selectHouse(WWHouse house) {
    try {
      emit(WWLoading(state.main));
      emit(WWLoaded(state.main.copyWith(selectedHouse: house, selectedTile: WWTiles.houses), showBottomSheet: true));
    } catch (e, s) {
      emit(WWError(state.main.copyWith(message: (e as dynamic).message.toString()), stackTrace: s.toString()));
    }
  }

  /// Selects a spell and shows the bottom sheet with the spell details.
  ///
  /// Emits a [WWLoading] state while processing.
  ///
  /// Emits a [WWLoaded] state with the selected spell and shows the bottom sheet.
  ///
  /// Emits a [WWError] state if an error occurs.
  void selectSpell(WWSpell spell) {
    try {
      emit(WWLoading(state.main));
      emit(WWLoaded(state.main.copyWith(selectedSpell: spell, selectedTile: WWTiles.spells), showBottomSheet: true));
    } catch (e, s) {
      emit(WWError(state.main.copyWith(message: (e as dynamic).message.toString()), stackTrace: s.toString()));
    }
  }

  /// Searches for items based on the [query] and updates the state with the filtered results.
  ///
  /// Emits a [WWLoading] state while processing.
  ///
  /// Emits a [WWLoaded] state with the filtered results.
  ///
  /// Emits a [WWError] state if an error occurs.
  void search(String query) {
    try {
      emit(WWLoading(state.main));
      WWTiles? tile = state.main.selectedTile;
      if (tile == null) {
        emit(WWLoaded(state.main));
        return;
      }
      switch (tile) {
        case WWTiles.houses:
          emit(WWLoaded(state.main.copyWith(filteredHouses: state.searchHouses(query, useFuzzy: true))));
        case WWTiles.spells:
          emit(WWLoaded(state.main.copyWith(filteredSpells: state.searchSpells(query, useFuzzy: true))));
        case WWTiles.wizards:
          emit(WWLoaded(state.main.copyWith(filteredWizards: state.searchWizards(query, useFuzzy: true))));
        case WWTiles.elixirs:
          emit(WWLoaded(state.main.copyWith(filteredElixirs: state.searchElixirs(query, useFuzzy: true))));
      }
    } catch (e, s) {
      emit(WWError(state.main.copyWith(message: (e as dynamic).message.toString()), stackTrace: s.toString()));
    }
  }
}