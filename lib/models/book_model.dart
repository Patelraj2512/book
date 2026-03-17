class BookModel {
  final String id;
  final String title;
  final String author;
  final String isbn;
  final String category;
  final String description;
  final int totalQuantity;
  final int availableQuantity;
  final String? coverImageUrl;
  final DateTime addedDate;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.isbn,
    required this.category,
    required this.description,
    required this.totalQuantity,
    this.availableQuantity = 0,
    this.coverImageUrl,
    required this.addedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'isbn': isbn,
      'category': category,
      'description': description,
      'totalQuantity': totalQuantity,
      'availableQuantity': availableQuantity,
      'coverImageUrl': coverImageUrl,
      'addedDate': addedDate.toIso8601String(),
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map, String documentId) {
    return BookModel(
      id: documentId,
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      isbn: map['isbn'] ?? '',
      category: map['category'] ?? '',
      description: map['description'] ?? '',
      totalQuantity: map['totalQuantity']?.toInt() ?? 0,
      availableQuantity: map['availableQuantity']?.toInt() ?? 0,
      coverImageUrl: map['coverImageUrl'],
      addedDate: map['addedDate'] != null 
          ? DateTime.parse(map['addedDate']) 
          : DateTime.now(),
    );
  }

  BookModel copyWith({
    String? id,
    String? title,
    String? author,
    String? isbn,
    String? category,
    String? description,
    int? totalQuantity,
    int? availableQuantity,
    String? coverImageUrl,
    DateTime? addedDate,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      isbn: isbn ?? this.isbn,
      category: category ?? this.category,
      description: description ?? this.description,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      addedDate: addedDate ?? this.addedDate,
    );
  }
}
