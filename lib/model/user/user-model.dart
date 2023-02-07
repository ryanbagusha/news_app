class UserModel {
  final String id;
  final String nama;
  final String email;
  final String username;
  final String role;
  final String idRole;

  const UserModel(
      {required this.id,
      required this.nama,
      required this.email,
      required this.username,
      required this.role,
      required this.idRole});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      username: json['username'],
      role: json['role'],
      idRole: json['id_role'],
    );
  }
}
