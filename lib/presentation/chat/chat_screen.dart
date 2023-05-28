import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child:CircleAvatar(
            backgroundImage: NetworkImage('https://pm1.narvii.com/7232/929b8b7047ef8bd59878a29d0f1cd62423e52632r1-600-900v2_uhq.jpg'),
          ),
          ),
          title: const Text('Mi amor ❤'),
          centerTitle: false,
        ),
      body: Center(
        child: FilledButton.tonal(
          onPressed: () {}, 
          child: const Text('Click me'),
        )
      ),
    );
  }
}