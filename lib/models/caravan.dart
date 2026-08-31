class Caravan {
  final String id;
  final String make;
  final String model;
  final double height; // metres
  final double width; // metres
  final double length; // metres
  final double maxAuthorisedMass; // kg (MTPLM)
  final double maxNoseWeight; // kg
  final DateTime createdAt;

  const Caravan({
    required this.id,
    required this.make,
    required this.model,
    required this.height,
    required this.width,
    required this.length,
    required this.maxAuthorisedMass,
    required this.maxNoseWeight,
    required this.createdAt,
  });

  // Convert to JSON for storage
  Map<String, dynamic> toJson() => {
    'id': id,
    'make': make,
    'model': model,
    'height': height,
    'width': width,
    'length': length,
    'maxAuthorisedMass': maxAuthorisedMass,
    'maxNoseWeight': maxNoseWeight,
    'createdAt': createdAt.toIso8601String(),
  };

  // Create from JSON
  factory Caravan.fromJson(Map<String, dynamic> json) => Caravan(
    id: json['id'],
    make: json['make'],
    model: json['model'],
    height: json['height'],
    width: json['width'],
    length: json['length'],
    maxAuthorisedMass: json['maxAuthorisedMass'],
    maxNoseWeight: json['maxNoseWeight'],
    createdAt: DateTime.parse(json['createdAt']),
  );

  Caravan copyWith({
    String? id,
    String? make,
    String? model,
    double? height,
    double? width,
    double? length,
    double? maxAuthorisedMass,
    double? maxNoseWeight,
    DateTime? createdAt,
  }) =>
      Caravan(
        id: id ?? this.id,
        make: make ?? this.make,
        model: model ?? this.model,
        height: height ?? this.height,
        width: width ?? this.width,
        length: length ?? this.length,
        maxAuthorisedMass: maxAuthorisedMass ?? this.maxAuthorisedMass,
        maxNoseWeight: maxNoseWeight ?? this.maxNoseWeight,
        createdAt: createdAt ?? this.createdAt,
      );
}
