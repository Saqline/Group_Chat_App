import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_project/db/dbhelper.dart';

import '../auth/firebase_auth.dart';
import '../models/message_model.dart';

class ChatRoomProvider extends ChangeNotifier {

  List<MessageModel> msgList = [];

  Future<void> addMessage(String msg) {
    final msgModel = MessageModel(
      msgId: DateTime.now().millisecondsSinceEpoch,
        userUid: AuthService.user!.uid,
        userName: AuthService.user!.displayName,
        userImage: AuthService.user!.photoURL,
        email: AuthService.user!.email!,
        msg: msg,
        timestamp: Timestamp.now()
    );
    return DbHelper.addMsg(msgModel);
  }

  getChatRoomMessage(){
    DbHelper.getAllChatRoomMessage().listen((snapshot) {
      msgList= List.generate(snapshot.docs.length, (index) =>
        MessageModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }
}