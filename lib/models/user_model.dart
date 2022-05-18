class User {
  final String UID;
  final double timestamp;
  final String SID;

  User({
    required this.UID,
    required this.SID,
    required this.timestamp,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      UID: json['id'] as String,
      timestamp: json['timestamp'] as double,
      SID: 'Currently unavailable',
    );
  }
}
