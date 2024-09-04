class UserModel {
  final String? name;
  final String email;

  UserModel({
    this.name,
    required this.email,
  });

  UserModel copyWith({
    String? name,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };

}
