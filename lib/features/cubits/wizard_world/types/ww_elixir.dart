import 'package:equatable/equatable.dart';
import 'package:wizard_world/features/core/helpers.dart';

import 'ww_ingredient.dart';

/// Represents an elixir in the Wizarding World.
class WWElixir extends Equatable {
  /// The unique identifier of the elixir.
  final String id;

  /// The name of the elixir.
  final String name;

  /// The effect of the elixir.
  final String effect;

  /// The side effects of the elixir.
  final String sideEffects;

  /// The characteristics of the elixir.
  final String characteristics;

  /// The time required to brew the elixir.
  final String time;

  /// The manufacturer of the elixir.
  final String manufacturer;

  /// The difficulty level of brewing the elixir.
  final WWElixirDifficulty difficulty;

  /// The list of ingredients required to brew the elixir.
  final List<WWIngredient> ingredients;

  /// The list of inventors of the elixir.
  final List<WWElixirInventor> inventors;

  /// Creates an instance of [WWElixir].
  ///
  /// All parameters are required and represent various attributes of the elixir.
  const WWElixir({
    required this.id,
    required this.name,
    required this.effect,
    required this.sideEffects,
    required this.characteristics,
    required this.time,
    required this.difficulty,
    required this.ingredients,
    required this.inventors,
    required this.manufacturer,
  });

  @override
  List<Object> get props => [
    id,
    name,
    effect,
    sideEffects,
    characteristics,
    time,
    difficulty,
    ingredients,
    inventors,
    manufacturer,
  ];

  /// Returns a copy of this elixir with the given fields replaced by new values.
  WWElixir copyWith({
    String? id,
    String? name,
    String? effect,
    String? sideEffects,
    String? characteristics,
    String? time,
    WWElixirDifficulty? difficulty,
    List<WWIngredient>? ingredients,
    List<WWElixirInventor>? inventors,
    String? manufacturer,
  }) {
    return WWElixir(
      id: id ?? this.id,
      name: name ?? this.name,
      effect: effect ?? this.effect,
      sideEffects: sideEffects ?? this.sideEffects,
      characteristics: characteristics ?? this.characteristics,
      time: time ?? this.time,
      difficulty: difficulty ?? this.difficulty,
      ingredients: ingredients ?? this.ingredients,
      inventors: inventors ?? this.inventors,
      manufacturer: manufacturer ?? this.manufacturer,
    );
  }

  /// Converts this elixir into a map representation.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'effect': effect,
      'sideEffects': sideEffects,
      'characteristics': characteristics,
      'time': time,
      'difficulty': difficulty.toString().split('.').last,
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'inventors': inventors.map((x) => x.toMap()).toList(),
      'manufacturer': manufacturer,
    };
  }

  /// Creates a [WWElixir] from a map representation.
  ///
  /// The [map] parameter must contain all the necessary keys to instantiate a [WWElixir].
  factory WWElixir.fromMap(Map<String, dynamic> map) {
    return WWElixir(
      id: map['id'] as String,
      name: map['name'] ?? 'Unknown',
      effect: map['effect'] ?? 'Unknown',
      sideEffects: map['sideEffects'] ?? 'Unknown',
      characteristics: map['characteristics'] ?? 'Unknown',
      time: map['time'] ?? 'Unknown',
      difficulty: (map['difficulty'] as String?)?.toEnum(WWElixirDifficulty.values) ?? WWElixirDifficulty.unknown,
      ingredients: List<WWIngredient>.from(
        map['ingredients']?.map((x) => WWIngredient.fromMap(x)) ?? [],
      ),
      inventors: List<WWElixirInventor>.from(
        map['inventors']?.map((x) => WWElixirInventor.fromMap(x)) ?? [],
      ),
      manufacturer: map['manufacturer'] ?? 'Unknown',
    );
  }
}

/// Represents an inventor of an elixir in the Wizarding World.
class WWElixirInventor extends Equatable {
  /// The unique identifier of the inventor.
  final String id;

  /// The first name of the inventor.
  final String firstName;

  /// The last name of the inventor.
  final String lastName;

  /// Creates an instance of [WWElixirInventor].
  const WWElixirInventor({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object> get props => [id, firstName, lastName];

  /// Returns a copy of this inventor with the given fields replaced by new values.
  WWElixirInventor copyWith({
    String? id,
    String? firstName,
    String? lastName,
  }) {
    return WWElixirInventor(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  /// Converts this inventor into a map representation.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  /// Creates a [WWElixirInventor] from a map representation.
  ///
  /// The [map] parameter must contain all the necessary keys to instantiate a [WWElixirInventor].
  factory WWElixirInventor.fromMap(Map<String, dynamic> map) {
    return WWElixirInventor(
      id: map['id'] as String,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
    );
  }
}

/// The difficulty levels of brewing an elixir.
enum WWElixirDifficulty {
  /// Unknown difficulty level.
  unknown,

  /// Advanced difficulty level.
  advanced,

  /// Moderate difficulty level.
  moderate,

  /// Beginner difficulty level.
  beginner,

  /// Ordinary Wizarding Level difficulty.
  ordinaryWizardingLevel,

  /// One-of-a-kind difficulty level.
  oneOfAKind,
}