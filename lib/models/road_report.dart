import 'package:latlong2/latlong.dart';

enum ReportType {
  narrowRoad,
  lowBridge,
  pothole,
  accident,
  construction,
  weatherHazard,
  parkingFull,
  fuelPrices,
  other,
}

enum ReportSeverity {
  low,
  medium,
  high,
  critical,
}

class RoadReport {
  final String id;
  final String userId;
  final LatLng location;
  final ReportType type;
  final ReportSeverity severity;
  final String title;
  final String description;
  final DateTime createdAt;
  final int upvotes;
  final int downvotes;
  final bool userVoted; // true = upvote, false = downvote, null = no vote
  final List<String>? tags;

  const RoadReport({
    required this.id,
    required this.userId,
    required this.location,
    required this.type,
    required this.severity,
    required this.title,
    required this.description,
    required this.createdAt,
    this.upvotes = 0,
    this.downvotes = 0,
    this.userVoted = false,
    this.tags,
  });

  // Credibility score (0-100)
  int get credibilityScore {
    int total = upvotes + downvotes;
    if (total == 0) return 50;
    return ((upvotes / total) * 100).toInt();
  }

  // Check if report is recent (within last 24 hours)
  bool get isRecent {
    return DateTime.now()
        .difference(createdAt)
        .inHours < 24;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'latitude': location.latitude,
    'longitude': location.longitude,
    'type': type.toString(),
    'severity': severity.toString(),
    'title': title,
    'description': description,
    'createdAt': createdAt.toIso8601String(),
    'upvotes': upvotes,
    'downvotes': downvotes,
    'tags': tags,
  };

  factory RoadReport.fromJson(Map<String, dynamic> json) => RoadReport(
    id: json['id'],
    userId: json['userId'],
    location: LatLng(
      json['latitude'],
      json['longitude'],
    ),
    type: ReportType.values.firstWhere(
      (e) => e.toString() == json['type'],
      orElse: () => ReportType.other,
    ),
    severity: ReportSeverity.values.firstWhere(
      (e) => e.toString() == json['severity'],
      orElse: () => ReportSeverity.medium,
    ),
    title: json['title'],
    description: json['description'],
    createdAt: DateTime.parse(json['createdAt']),
    upvotes: json['upvotes'] ?? 0,
    downvotes: json['downvotes'] ?? 0,
    tags: List<String>.from(json['tags'] ?? []),
  );
}
