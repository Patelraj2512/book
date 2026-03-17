class UserModel {
  final String uid;
  final String email;
  final String name;
  final String role; // 'admin' or 'student'
  final String? studentId;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
    this.studentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'role': role,
      'studentId': studentId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      uid: documentId,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      role: map['role'] ?? 'student',
      studentId: map['studentId'],
    );
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? role,
    String? studentId,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      studentId: studentId ?? this.studentId,
    );
  }
}
