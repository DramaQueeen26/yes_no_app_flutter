import 'package:flutter/material.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: '¡Hola amor!', fromWho: FromWho.me),
    Message(text: '¿Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage( String text ) async {

    if ( text.isEmpty ) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add( newMessage );

    notifyListeners(); //* Notificar los cambios del provider
    moveScrollToBottom();

  }

  Future<void> moveScrollToBottom() async {

    await Future.delayed( const Duration( milliseconds: 100 ) );

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration( milliseconds: 300 ), 
      curve: Curves.easeOut
    );
    
  }

}