class UserModel {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String location;
  final double farmSize;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.location,
    required this.farmSize,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      location: json['location'],
      farmSize: (json['farmSize'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'location': location,
      'farmSize': farmSize,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? location,
    double? farmSize,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      farmSize: farmSize ?? this.farmSize,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
