import 'package:flutter/material.dart';
import 'package:new_project/providers/chat_room_provider.dart';
import 'package:new_project/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/message_item.dart';

class ChatRoomPage extends StatefulWidget {
  static const String routeName = '/chat_room_page';

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  bool isTrue = true;
  final textController=TextEditingController();

  @override
  void didChangeDependencies() {
    if (isTrue) {
      Provider.of<ChatRoomProvider>(context, listen: false)
          .getChatRoomMessage();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    textController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      drawer: MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Chat Room'),
      ),
      body: Consumer<ChatRoomProvider>(
        builder: (context, provider, _) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: provider.msgList.length,
                  itemBuilder: (context,index){
                    final messageModel= provider.msgList[index];
                    return MessageItem(messageModel: messageModel,);
                  },
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24)
                          ),
                          hintText: 'Type Your Message here'
                        ),
                      )
                  ),
                  IconButton(
                      onPressed: (){
                        if(textController.text.isEmpty) return;
                        provider.addMessage(textController.text);
                        textController.clear();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Theme.of(context).primaryColor,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
