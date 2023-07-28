import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_anwser.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnwser getYesNoAnwser = GetYesNoAnwser();

  List<Message> messageList = [
    Message(text: '¡Hola amor!', fromWho: FromWho.me),
    Message(text: '¿Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage( String text ) async {

    if ( text.isEmpty ) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add( newMessage );

    if( text.endsWith('?') ) hisReply();

    notifyListeners(); //* Notificar los cambios del provider
    moveScrollToBottom();

  }

  Future<void> hisReply() async{

    final hisMessage = await getYesNoAnwser.getAnswer();

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