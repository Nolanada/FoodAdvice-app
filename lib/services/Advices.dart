import 'package:cloud_firestore/cloud_firestore.dart';

class AdviceServices {
  final CollectionReference postsCollection = FirebaseFirestore.instance.collection('posts');

  Future<void> addFoodPost(String userName, String category, String content) async {
    String postId = postsCollection.doc().id; // Generate a unique ID for the new post
    await postsCollection.doc(postId).set({
      'id': postId,
      'userName': userName,
      'type':'Advice',
      'category': category,
      'content': content,
      'timestamp': Timestamp.now(),
    });
  }

  // // Factory method to create Advice from Firestore
  Stream<List<Map<String, dynamic>>> getBreakfastAdvices() {
    return postsCollection
        .where('category', isEqualTo: 'Breakfast')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
  }

  Future<Map<String, dynamic>?> getBreakfastPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Breakfast').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched breakfast post: $post');
      return post;
    } else {
      print('No breakfast post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getLunchPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Lunch').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched lunch post: $post');
      return post;
    } else {
      print('No lunch post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getSupperPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Supper').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched supper post: $post');
      return post;
    } else {
      print('No supper supper found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getDinnerPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Dinner').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched dinner post: $post');
      return post;
    } else {
      print('No dinner post found');
      return null;
    }
  }
}