import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  //collection Reference
  final CollectionReference preference = FirebaseFirestore.instance.collection(
      'FoodAdvice');

  Future updateUserData(String name, String date, String category,
      String content) async {
    return await preference.doc(uid).set({
      'advice': date,
      'name': name,
      'category': category,
      'String': content,
    }
    );
  }


  Stream<QuerySnapshot> get preferenceStream {
    return preference.snapshots();
  }
}
