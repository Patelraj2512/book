import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../models/book_model.dart';
import '../models/issued_book_model.dart';
import '../models/fine_model.dart';

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService(FirebaseFirestore.instance);
});

class FirestoreService {
  final FirebaseFirestore _db;

  FirestoreService(this._db);

  // --- Users ---
  Future<void> createUser(UserModel user) async {
    await _db.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      return UserModel.fromMap(doc.data()!, doc.id);
    }
    return null;
  }

  // --- Books ---
  Future<void> addBook(BookModel book) async {
    await _db.collection('books').doc(book.id).set(book.toMap());
  }

  Future<void> updateBook(BookModel book) async {
    await _db.collection('books').doc(book.id).update(book.toMap());
  }

  Future<void> deleteBook(String bookId) async {
    await _db.collection('books').doc(bookId).delete();
  }

  Stream<List<BookModel>> getBooksStream() {
    return _db.collection('books').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => BookModel.fromMap(doc.data(), doc.id)).toList();
    });
  }

  // --- Issued Books ---
  Future<void> issueBook(IssuedBookModel issuedBook) async {
    await _db.collection('issued_books').doc(issuedBook.id).set(issuedBook.toMap());
    
    // Decrease available quantity
    final bookRef = _db.collection('books').doc(issuedBook.bookId);
    await _db.runTransaction((transaction) async {
      final snapshot = await transaction.get(bookRef);
      if (!snapshot.exists) return;
      final currentQuantity = snapshot.data()?['availableQuantity'] ?? 0;
      if (currentQuantity > 0) {
        transaction.update(bookRef, {'availableQuantity': currentQuantity - 1});
      }
    });
  }

  Stream<List<IssuedBookModel>> getStudentIssuedBooks(String studentId) {
    return _db
        .collection('issued_books')
        .where('studentId', isEqualTo: studentId)
        .where('status', isEqualTo: 'issued')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => IssuedBookModel.fromMap(doc.data(), doc.id)).toList());
  }

  // --- Fines ---
  Stream<List<FineModel>> getStudentFines(String studentId) {
    return _db
        .collection('fines')
        .where('studentId', isEqualTo: studentId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => FineModel.fromMap(doc.data(), doc.id)).toList());
  }
}
