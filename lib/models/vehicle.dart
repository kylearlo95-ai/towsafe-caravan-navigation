class Vehicle {
  final String id;
  final String make;
  final String model;
  final double height; // metres
  final double width; // metres
  final double length; // metres
  final double weight; // kg
  final double towingCapacity; // kg
  final DateTime createdAt;

  const Vehicle({
    required this.id,
    required this.make,
    required this.model,
    required this.height,
    required this.width,
    required this.length,
    required this.weight,
    required this.towingCapacity,
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
    'weight': weight,
    'towingCapacity': towingCapacity,
    'createdAt': createdAt.toIso8601String(),
  };

  // Create from JSON
  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json['id'],
    make: json['make'],
    model: json['model'],
    height: json['height'],
    width: json['width'],
    length: json['length'],
    weight: json['weight'],
    towingCapacity: json['towingCapacity'],
    createdAt: DateTime.parse(json['createdAt']),
  );

  Vehicle copyWith({
    String? id,
    String? make,
    String? model,
    double? height,
    double? width,
    double? length,
    double? weight,
    double? towingCapacity,
    DateTime? createdAt,
  }) =>
      Vehicle(
        id: id ?? this.id,
        make: make ?? this.make,
        model: model ?? this.model,
        height: height ?? this.height,
        width: width ?? this.width,
        length: length ?? this.length,
        weight: weight ?? this.weight,
        towingCapacity: towingCapacity ?? this.towingCapacity,
        createdAt: createdAt ?? this.createdAt,
      );
}
