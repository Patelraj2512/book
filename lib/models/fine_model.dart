class FineModel {
  final String id;
  final String studentId;
  final String issuedBookId;
  final double amount;
  final String status; // 'unpaid', 'paid'
  final DateTime createdAt;
  final DateTime? paidAt;

  FineModel({
    required this.id,
    required this.studentId,
    required this.issuedBookId,
    required this.amount,
    required this.status,
    required this.createdAt,
    this.paidAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'issuedBookId': issuedBookId,
      'amount': amount,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'paidAt': paidAt?.toIso8601String(),
    };
  }

  factory FineModel.fromMap(Map<String, dynamic> map, String documentId) {
    return FineModel(
      id: documentId,
      studentId: map['studentId'] ?? '',
      issuedBookId: map['issuedBookId'] ?? '',
      amount: (map['amount'] ?? 0.0).toDouble(),
      status: map['status'] ?? 'unpaid',
      createdAt: DateTime.parse(map['createdAt']),
      paidAt: map['paidAt'] != null ? DateTime.parse(map['paidAt']) : null,
    );
  }

  FineModel copyWith({
    String? id,
    String? studentId,
    String? issuedBookId,
    double? amount,
    String? status,
    DateTime? createdAt,
    DateTime? paidAt,
  }) {
    return FineModel(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      issuedBookId: issuedBookId ?? this.issuedBookId,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      paidAt: paidAt ?? this.paidAt,
    );
  }
}
