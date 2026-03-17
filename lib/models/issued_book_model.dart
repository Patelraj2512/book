class IssuedBookModel {
  final String id;
  final String bookId;
  final String studentId;
  final DateTime issueDate;
  final DateTime dueDate;
  final DateTime? returnDate;
  final String status; // 'issued', 'returned', 'overdue'

  IssuedBookModel({
    required this.id,
    required this.bookId,
    required this.studentId,
    required this.issueDate,
    required this.dueDate,
    this.returnDate,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'studentId': studentId,
      'issueDate': issueDate.toIso8601String(),
      'dueDate': dueDate.toIso8601String(),
      'returnDate': returnDate?.toIso8601String(),
      'status': status,
    };
  }

  factory IssuedBookModel.fromMap(Map<String, dynamic> map, String documentId) {
    return IssuedBookModel(
      id: documentId,
      bookId: map['bookId'] ?? '',
      studentId: map['studentId'] ?? '',
      issueDate: DateTime.parse(map['issueDate']),
      dueDate: DateTime.parse(map['dueDate']),
      returnDate: map['returnDate'] != null ? DateTime.parse(map['returnDate']) : null,
      status: map['status'] ?? 'issued',
    );
  }

  IssuedBookModel copyWith({
    String? id,
    String? bookId,
    String? studentId,
    DateTime? issueDate,
    DateTime? dueDate,
    DateTime? returnDate,
    String? status,
  }) {
    return IssuedBookModel(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      studentId: studentId ?? this.studentId,
      issueDate: issueDate ?? this.issueDate,
      dueDate: dueDate ?? this.dueDate,
      returnDate: returnDate ?? this.returnDate,
      status: status ?? this.status,
    );
  }
}
