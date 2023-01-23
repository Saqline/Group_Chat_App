import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/models/message_model.dart';

import '../models/user_model.dart';

class DbHelper{
  static const String _collectionUser= 'Users';
  static const String _collectionChatRoomMessage= 'chatRoomMessages';
  static final FirebaseFirestore _db= FirebaseFirestore.instance;

  static Future<void> adduser(UserModel usermodel){
    final doc= _db.collection(_collectionUser).doc(usermodel.uid);
    return doc.set(usermodel.toMap());
  }

  static Future<void> addMsg (MessageModel messageModel)=>
      _db.collection(_collectionChatRoomMessage)
          .doc().set(messageModel.toMap());

  static Stream<QuerySnapshot<Map<String,dynamic>>> getAllChatRoomMessage()=>
    _db.collection(_collectionChatRoomMessage)
        .orderBy('msgId',descending: true)
        .snapshots();
  static Stream<QuerySnapshot<Map<String,dynamic>>> getAllChatRemainingUsers(String uid)=>
      _db.collection(_collectionUser)
          .where('uid', isNotEqualTo: uid)
          .snapshots();

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById(String uid)=>
      _db.collection(_collectionUser).doc(uid).snapshots();

  static Future<void> updateProfile(String uid, Map<String, dynamic> map) {
    return _db.collection(_collectionUser).doc(uid).update(map);
  }
}