import 'package:equatable/equatable.dart';
import 'package:wizard_world/features/core/helpers.dart';

/// Represents a spell in the Wizarding World.
///
/// Extends [Equatable] to provide value equality.
class WWSpell extends Equatable {
  /// The unique identifier of the spell.
  final String id;

  /// The name of the spell.
  final String name;

  /// The incantation of the spell.
  final String incantation;

  /// The effect of the spell.
  final String effect;

  /// Indicates whether the spell can be verbal.
  final bool? canBeVerbal;

  /// The type of the spell.
  final SpellType type;

  /// The light produced by the spell.
  final SpellLight light;

  /// The creator of the spell.
  final String creator;

  /// Creates a [WWSpell] with the given attributes.
  ///
  /// All fields are required except [canBeVerbal].
  const WWSpell({
    required this.id,
    required this.name,
    required this.incantation,
    required this.effect,
    required this.type,
    required this.light,
    required this.creator,
    this.canBeVerbal,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    incantation,
    effect,
    canBeVerbal,
    type,
    light,
    creator,
  ];

  /// Returns a copy of this spell with the given fields replaced by new values.
  ///
  /// If a field is not provided, the current value is used.
  WWSpell copyWith({
    String? id,
    String? name,
    String? incantation,
    String? effect,
    bool? canBeVerbal,
    SpellType? type,
    SpellLight? light,
    String? creator,
  }) {
    return WWSpell(
      id: id ?? this.id,
      name: name ?? this.name,
      incantation: incantation ?? this.incantation,
      effect: effect ?? this.effect,
      canBeVerbal: canBeVerbal ?? this.canBeVerbal,
      type: type ?? this.type,
      light: light ?? this.light,
      creator: creator ?? this.creator,
    );
  }

  /// Converts this spell into a map representation.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'incantation': incantation,
      'effect': effect,
      'canBeVerbal': canBeVerbal,
      'type': type.name.capitalizeFirst(),
      'light': light.name.capitalizeFirst(),
      'creator': creator,
    };
  }

  /// Creates a [WWSpell] from a map representation.
  ///
  /// If certain fields are missing, they default to 'Unknown' or appropriate default values.
  factory WWSpell.fromMap(Map<String, dynamic> map) {
    return WWSpell(
      id: map['id'] as String,
      name: map['name'] ?? 'Unknown',
      incantation: map['incantation'] ?? 'Unknown',
      effect: map['effect'] ?? 'Unknown',
      canBeVerbal: map['canBeVerbal'] as bool?,
      type: (map['type'] as String?)?.toEnum(SpellType.values) ?? SpellType.none,
      light: (map['light'] as String?)?.toEnum(SpellLight.values) ?? SpellLight.none,
      creator: map['creator'] ?? 'Unknown',
    );
  }
}

/// The possible lights produced by spells.
enum SpellLight {
  none,
  blue,
  icyBlue,
  red,
  gold,
  purple,
  transparent,
  white,
  green,
  orange,
  yellow,
  brightBlue,
  pink,
  violet,
  blueishWhite,
  silver,
  scarlet,
  fire,
  fieryScarlet,
  grey,
  darkRed,
  turquoise,
  psychedelicTransparentWave,
  brightYellow,
  blackSmoke,
}

/// The possible types of spells.
enum SpellType {
  none,
  charm,
  conjuration,
  spell,
  transfiguration,
  healingSpell,
  darkCharm,
  jinx,
  curse,
  magicalTransportation,
  hex,
  counterSpell,
  darkArts,
  counterJinx,
  counterCharm,
  untransfiguration,
  bindingMagicalContract,
  vanishment,
}