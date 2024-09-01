import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  late String email;
  late String uid;
  late String displayName;
  late DateTime timestamp;
  UserModel(
      {required this.email,
      required this.uid,
      required this.displayName,
      required this.timestamp});
  Map toMap(UserModel user) {
    var data = <String, dynamic>{};
    data['uid'] = user.uid;
    data['username'] = user.displayName;
    data['email'] = user.email;
    data['timestamp'] = user.timestamp;
    return data;
  }

  UserModel.fromMap(Map<String, dynamic> mapData, {required uid}) {
    uid = mapData['uid'];
    displayName = mapData['displayName'];
    email = mapData['email'];
  }
}
