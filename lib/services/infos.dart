import 'package:cloud_firestore/cloud_firestore.dart';

class InfoServices {
  final CollectionReference postsCollection = FirebaseFirestore.instance.collection('posts');

  Future<void> addFoodPost(String userName, String category, String content) async {
    String postId = postsCollection.doc().id; // Generate a unique ID for the new post
    await postsCollection.doc(postId).set({
      'id': postId,
      'userName': userName,
      'category': category,
      'content': content,
      'timestamp': Timestamp.now(),
    });
  }

  // // Factory method to create Advice from Firestore
  // Stream<List<Map<String, dynamic>>> getBreakfastAdvices() {
  //   return postsCollection
  //       .where('category', isEqualTo: 'Breakfast')
  //       .orderBy('timestamp', descending: true)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
  // }

  Future<Map<String, dynamic>?> getProteinPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Protein').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Protein post: $post');
      return post;
    } else {
      print('No Protein post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCarbohydratesPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Carbohydrates').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Carbohydrates post: $post');
      return post;
    } else {
      print('No Carbohydrates post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getLipidsPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Lipids').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Lipids post: $post');
      return post;
    } else {
      print('No supper Lipids found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getVitaminsPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Vitamins').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Vitamins post: $post');
      return post;
    } else {
      print('No Vitamins post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getRuffagePost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Ruffage').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Ruffage post: $post');
      return post;
    } else {
      print('No Ruffage post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getWaterPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Water').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Water post: $post');
      return post;
    } else {
      print('No Water post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getDiabetesPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Diabetes').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Diabetes post: $post');
      return post;
    } else {
      print('No Diabetes post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCeliacPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Celiac').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Celiac post: $post');
      return post;
    } else {
      print('No Celiac post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getIronPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Iron').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Iron post: $post');
      return post;
    } else {
      print('No Iron post found');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getOthersPost() async {
    QuerySnapshot snapshot = await postsCollection.where('category', isEqualTo: 'Others').get();
    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> post = snapshot.docs.first.data() as Map<String, dynamic>;
      print('Fetched Others post: $post');
      return post;
    } else {
      print('No Others post found');
      return null;
    }
  }
}