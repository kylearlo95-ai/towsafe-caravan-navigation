import 'package:latlong2/latlong.dart';

class RouteResult {
  final List<LatLng> points;
  final double distanceKm;
  final double durationMinutes;
  final String routeType; // "fastest", "safest", "balanced"
  final int restrictionCount;
  final int dangerousRestrictionCount;
  final double safetyScore; // 0-100
  final DateTime calculatedAt;

  const RouteResult({
    required this.points,
    required this.distanceKm,
    required this.durationMinutes,
    required this.routeType,
    required this.restrictionCount,
    required this.dangerousRestrictionCount,
    required this.safetyScore,
    required this.calculatedAt,
  });

  // Determine if route is safe for towing
  bool get isSafe => dangerousRestrictionCount == 0;

  // Get display name
  String get displayName {
    switch (routeType) {
      case 'fastest':
        return 'Fastest';
      case 'safest':
        return 'Safest for Caravans';
      case 'balanced':
        return 'Balanced';
      default:
        return 'Route';
    }
  }
}
