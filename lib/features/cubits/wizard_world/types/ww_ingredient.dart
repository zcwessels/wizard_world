import 'package:equatable/equatable.dart';

/// An ingredient in the Wizarding World.
///
/// Provides value equality by extending [Equatable].
class WWIngredient extends Equatable {
  /// The unique identifier of the ingredient.
  final String id;

  /// The name of the ingredient.
  final String name;

  /// Creates a [WWIngredient] with the given [id] and [name].
  const WWIngredient({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
    id,
    name,
  ];

  /// Returns a copy of this ingredient with the given fields replaced by new values.
  ///
  /// If a field is not provided, the current value is used.
  WWIngredient copyWith({
    String? id,
    String? name,
  }) {
    return WWIngredient(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  /// Converts this ingredient into a map representation.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  /// Creates a [WWIngredient] from a map representation.
  ///
  /// The [map] must contain the key 'id'. If 'name' is not provided, it defaults to 'Unknown'.
  factory WWIngredient.fromMap(Map<String, dynamic> map) {
    return WWIngredient(
      id: map['id'] as String,
      name: map['name'] ?? 'Unknown',
    );
  }
}