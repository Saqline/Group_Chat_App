import 'package:flutter/material.dart';
import 'package:new_project/models/message_model.dart';
import 'package:new_project/utills/helper_function.dart';

import '../auth/firebase_auth.dart';

class MessageItem extends StatelessWidget {
  final MessageModel messageModel;
  const MessageItem({Key? key,required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: messageModel.userUid==AuthService.user!.uid
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(messageModel.userName?? messageModel.email,style: TextStyle(color:Colors.blue,fontSize: 13),),
            Text(getDateTimrFormatted(messageModel.timestamp.toDate(), 'dd/MM/yyyy HH:mm'),style: TextStyle(color:Colors.grey,fontSize: 13),),
            Text(messageModel.msg,style: TextStyle(color:Colors.grey,fontSize: 15),textAlign: TextAlign.justify,),
          ],
        ),
      ),
    );
  }
}
