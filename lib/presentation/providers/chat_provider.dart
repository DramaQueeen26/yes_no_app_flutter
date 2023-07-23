import 'package:flutter/material.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messageList = [
    Message(text: '¡Hola amor!', fromWho: FromWho.me),
    Message(text: '¿Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage( String text ) async {

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add( newMessage );

    notifyListeners(); //* Notificar los cambios del provider

  }

}