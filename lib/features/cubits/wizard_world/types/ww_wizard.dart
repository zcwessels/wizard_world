import 'package:equatable/equatable.dart';

/// A wizard in the Wizarding World.
///
/// Provides value equality by extending [Equatable].
class WWWizard extends Equatable {
  /// The unique identifier of the wizard.
  final String id;

  /// The first name of the wizard.
  final String firstName;

  /// The last name of the wizard.
  final String lastName;

  /// The list of elixirs associated with the wizard.
  final List<WWWizardElixir> elixirs;

  /// Creates a [WWWizard] with the specified attributes.
  const WWWizard({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.elixirs,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, elixirs];

  /// Returns a copy of this wizard with the given fields replaced by new values.
  ///
  /// If a field is not provided, the current value is used.
  WWWizard copyWith({
    String? id,
    String? firstName,
    String? lastName,
    List<WWWizardElixir>? elixirs,
  }) {
    return WWWizard(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      elixirs: elixirs ?? this.elixirs,
    );
  }

  /// Converts this wizard into a map representation.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'elixirs': elixirs.map((x) => x.toMap()).toList(),
    };
  }

  /// Creates a [WWWizard] from a map representation.
  ///
  /// If certain fields are missing, they default to empty strings or empty lists.
  factory WWWizard.fromMap(Map<String, dynamic> map) {
    return WWWizard(
      id: map['id'] as String,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      elixirs: List<WWWizardElixir>.from(
        map['elixirs']?.map((x) => WWWizardElixir.fromMap(x)) ?? [],
      ),
    );
  }
}

/// An elixir associated with a wizard.
///
/// Provides value equality by extending [Equatable].
class WWWizardElixir extends Equatable {
  /// The unique identifier of the elixir.
  final String id;

  /// The name of the elixir.
  final String name;

  /// Creates a [WWWizardElixir] with the given [id] and [name].
  const WWWizardElixir({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  /// Returns a copy of this elixir with the given fields replaced by new values.
  ///
  /// If a field is not provided, the current value is used.
  WWWizardElixir copyWith({
    String? id,
    String? name,
  }) {
    return WWWizardElixir(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  /// Converts this elixir into a map representation.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  /// Creates a [WWWizardElixir] from a map representation.
  ///
  /// If 'name' is not provided, it defaults to 'Unknown'.
  factory WWWizardElixir.fromMap(Map<String, dynamic> map) {
    return WWWizardElixir(
      id: map['id'] as String,
      name: map['name'] ?? 'Unknown',
    );
  }
}