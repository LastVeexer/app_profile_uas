import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createPost(Map<String, dynamic> data) async {
    await _db.collection('posts').add(data);
  }

  Future<DocumentSnapshot> getPost(String id) async {
    return await _db.collection('posts').doc(id).get();
  }

  Future<QuerySnapshot> getAllPosts() async {
    return await _db.collection('profiles').get();
  }
}
