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
}
