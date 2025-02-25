import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesService{
  final CollectionReference itemsCollection = FirebaseFirestore.instance.collection('items');

  Stream<List<DocumentSnapshot>> getUserFavoriteItemsStream(String userId) {
    return itemsCollection.where('favoritedBy', arrayContains: userId).snapshots().map((snapshot) => snapshot.docs);
  }

  Future<void> favoritePost(String userId, String postId) async {
    await itemsCollection.doc(postId).update({
      'favoritedBy': FieldValue.arrayUnion([userId]),
    });
  }
}