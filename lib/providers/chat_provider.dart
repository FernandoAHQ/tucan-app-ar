import 'package:flutter/material.dart';

import '../models/message.dart';

enum ServerStatus { online, offline, connecting }

class ChatProvider extends ChangeNotifier {
  List<ChatMessage> messages = [];


  void addResponse(String msg){
    messages.add(ChatMessage(messageContent: msg, messageType: "receiver"));
    notifyListeners();
  }
  

  void sendMessage(String msg){
    messages.add(ChatMessage(messageContent: msg, messageType: "sender"));
    notifyListeners();
  }
  

  List<ChatMessage> getMessages(){
    return messages;
  }
}
