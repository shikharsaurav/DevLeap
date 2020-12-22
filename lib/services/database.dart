import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;

  DataBaseService({this.uid});

  //collection reference
  final CollectionReference infoCollection =
      Firestore.instance.collection('personalInfo');

  Future updateUserData(String firstName, String lastName, String location,
      String profession) async {
    return await infoCollection.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'profession': profession,
    });
  }

  //get brews stream
  Stream<QuerySnapshot> get infos {
    return infoCollection.snapshots();
  }
}
