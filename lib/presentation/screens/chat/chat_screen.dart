import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';

import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: _ChatView(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child:CircleAvatar(
          backgroundImage: NetworkImage('https://pm1.narvii.com/7232/929b8b7047ef8bd59878a29d0f1cd62423e52632r1-600-900v2_uhq.jpg'),
        ),
        ),
        title: const Text('Mi amor ❤'),
        centerTitle: false,
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                
                  final message = chatProvider.messageList[index];
                  return ( message.fromWho == FromWho.his )
                  ? HisMessageBubble( message: message )
                  : MyMessageBubble( message: message );

              },)
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}