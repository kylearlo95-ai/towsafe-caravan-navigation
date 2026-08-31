import 'package:latlong2/latlong.dart';

class CaravanSite {
  final String id;
  final String name;
  final LatLng location;
  final String? address;
  final String? phone;
  final String? website;
  final double? rating; // 0-5
  final int? reviewCount;
  final List<String> amenities; // e.g., "wifi", "electric", "water", "toilets"
  final double? distanceKm;
  final bool? isFavourite;

  const CaravanSite({
    required this.id,
    required this.name,
    required this.location,
    this.address,
    this.phone,
    this.website,
    this.rating,
    this.reviewCount,
    required this.amenities,
    this.distanceKm,
    this.isFavourite = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'latitude': location.latitude,
    'longitude': location.longitude,
    'address': address,
    'phone': phone,
    'website': website,
    'rating': rating,
    'reviewCount': reviewCount,
    'amenities': amenities,
    'distanceKm': distanceKm,
    'isFavourite': isFavourite,
  };

  factory CaravanSite.fromJson(Map<String, dynamic> json) => CaravanSite(
    id: json['id'],
    name: json['name'],
    location: LatLng(
      json['latitude'],
      json['longitude'],
    ),
    address: json['address'],
    phone: json['phone'],
    website: json['website'],
    rating: json['rating']?.toDouble(),
    reviewCount: json['reviewCount'],
    amenities: List<String>.from(json['amenities'] ?? []),
    distanceKm: json['distanceKm']?.toDouble(),
    isFavourite: json['isFavourite'] ?? false,
  );
}
