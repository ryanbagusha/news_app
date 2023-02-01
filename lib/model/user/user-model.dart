class UserModel {
  final String id;
  final String nama;
  final String email;
  final String username;
  final String role;

  const UserModel(
      {required this.id,
      required this.nama,
      required this.email,
      required this.username,
      required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      username: json['username'],
      role: json['role'],
    );
  }
}
