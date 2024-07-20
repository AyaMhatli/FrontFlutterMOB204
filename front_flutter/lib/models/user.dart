class User {
  int id;
  int officeId;
  int departmentId;
  int roleId;
  String role;
  String name;
  String username;
  String description;
  String avatar;
  String email;
  String password;
  String status;
  DateTime lastLogin;
  DateTime lastLogout;
  bool active;
  String sessionId;

  User({
    required this.id,
    required this.officeId,
    required this.departmentId,
    required this.roleId,
    required this.role,
    required this.name,
    required this.username,
    required this.description,
    required this.avatar,
    required this.email,
    required this.password,
    required this.status,
    required this.lastLogin,
    required this.lastLogout,
    required this.active,
    required this.sessionId,
  });

  // Convert JSON to User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      officeId: json['office_id'],
      departmentId: json['department_id'],
      roleId: json['role_id'],
      role: json['role'],
      name: json['name'],
      username: json['username'],
      description: json['description'],
      avatar: json['avatar'],
      email: json['email'],
      password: json['password'],
      status: json['status'],
      lastLogin: DateTime.parse(json['last_login']),
      lastLogout: DateTime.parse(json['last_logout']),
      active: json['active'],
      sessionId: json['session_id'],
    );
  }

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'office_id': officeId,
      'department_id': departmentId,
      'role_id': roleId,
      'role': role,
      'name': name,
      'username': username,
      'description': description,
      'avatar': avatar,
      'email': email,
      'password': password,
      'status': status,
      'last_login': lastLogin.toIso8601String(),
      'last_logout': lastLogout.toIso8601String(),
      'active': active,
      'session_id': sessionId,
    };
  }
}
