import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/him_message_bubble.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                return ( index % 2 == 0 )
                ? const HimMessageBubble()
                : const MyMessageBubble();
              },)
            ),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}