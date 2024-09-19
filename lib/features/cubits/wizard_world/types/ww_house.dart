import 'package:equatable/equatable.dart';

/// Represents a house in the Wizarding World.
class WWHouse extends Equatable {
  /// The unique identifier of the house.
  final String id;

  /// The name of the house.
  final String name;

  /// The house colors.
  final String houseColours;

  /// The founder of the house.
  final String founder;

  /// The animal associated with the house.
  final String animal;

  /// The element associated with the house.
  final String element;

  /// The ghost associated with the house.
  final String ghost;

  /// The common room of the house.
  final String commonRoom;

  /// The list of heads of the house.
  final List<WWHouseHead> heads;

  /// The list of traits associated with the house.
  final List<WWTrait> traits;

  /// Creates a [WWHouse] with the specified attributes.
  const WWHouse({
    required this.id,
    required this.name,
    required this.houseColours,
    required this.founder,
    required this.animal,
    required this.element,
    required this.ghost,
    required this.commonRoom,
    required this.heads,
    required this.traits,
  });

  @override
  List<Object> get props => [
    id,
    name,
    houseColours,
    founder,
    animal,
    element,
    ghost,
    commonRoom,
    heads,
    traits,
  ];

  /// Returns a copy of this house with the given fields replaced by new values.
  WWHouse copyWith({
    String? id,
    String? name,
    String? houseColours,
    String? founder,
    String? animal,
    String? element,
    String? ghost,
    String? commonRoom,
    List<WWHouseHead>? heads,
    List<WWTrait>? traits,
  }) {
    return WWHouse(
      id: id ?? this.id,
      name: name ?? this.name,
      houseColours: houseColours ?? this.houseColours,
      founder: founder ?? this.founder,
      animal: animal ?? this.animal,
      element: element ?? this.element,
      ghost: ghost ?? this.ghost,
      commonRoom: commonRoom ?? this.commonRoom,
      heads: heads ?? this.heads,
      traits: traits ?? this.traits,
    );
  }

  /// Converts this house into a map representation.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'houseColours': houseColours,
      'founder': founder,
      'animal': animal,
      'element': element,
      'ghost': ghost,
      'commonRoom': commonRoom,
      'heads': heads.map((x) => x.toMap()).toList(),
      'traits': traits.map((x) => x.toMap()).toList(),
    };
  }

  /// Creates a [WWHouse] from a map representation.
  ///
  /// The [map] must contain all the necessary keys to instantiate a [WWHouse].
  factory WWHouse.fromMap(Map<String, dynamic> map) {
    return WWHouse(
      id: map['id'] as String,
      name: map['name'] as String,
      houseColours: map['houseColours'] as String,
      founder: map['founder'] as String,
      animal: map['animal'] as String,
      element: map['element'] as String,
      ghost: map['ghost'] as String,
      commonRoom: map['commonRoom'] as String,
      heads: List<WWHouseHead>.from(
        map['heads']?.map((x) => WWHouseHead.fromMap(x)) ?? [],
      ),
      traits: List<WWTrait>.from(
        map['traits']?.map((x) => WWTrait.fromMap(x)) ?? [],
      ),
    );
  }
}

/// Represents a head of a house in the Wizarding World.
class WWHouseHead extends Equatable {
  /// The unique identifier of the house head.
  final String id;

  /// The first name of the house head.
  final String firstName;

  /// The last name of the house head.
  final String lastName;

  /// Creates a [WWHouseHead] with the specified attributes.
  const WWHouseHead({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object> get props => [id, firstName, lastName];

  /// Returns a copy of this house head with the given fields replaced by new values.
  WWHouseHead copyWith({
    String? id,
    String? firstName,
    String? lastName,
  }) {
    return WWHouseHead(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  /// Converts this house head into a map representation.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  /// Creates a [WWHouseHead] from a map representation.
  ///
  /// The [map] must contain all the necessary keys to instantiate a [WWHouseHead].
  factory WWHouseHead.fromMap(Map<String, dynamic> map) {
    return WWHouseHead(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
    );
  }
}

/// Represents a trait associated with a house in the Wizarding World.
class WWTrait extends Equatable {
  /// The unique identifier of the trait.
  final String id;

  /// The name of the trait.
  final String name;

  /// Creates a [WWTrait] with the specified attributes.
  const WWTrait({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  /// Returns a copy of this trait with the given fields replaced by new values.
  WWTrait copyWith({
    String? id,
    String? name,
  }) {
    return WWTrait(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  /// Converts this trait into a map representation.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  /// Creates a [WWTrait] from a map representation.
  ///
  /// The [map] must contain all the necessary keys to instantiate a [WWTrait].
  factory WWTrait.fromMap(Map<String, dynamic> map) {
    return WWTrait(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}