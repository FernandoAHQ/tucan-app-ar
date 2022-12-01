import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';
import '../providers/sockets.dart';
import '../providers/userData.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage();

  @override
  Widget build(BuildContext context) {
    //context.read<ProviderSocket>().passContext(context);

    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    final textEditor = TextEditingController();
    final userId = Provider.of<ProviderUserData>(context).id;
    String message = '';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/originals/46/dc/d7/46dcd7b4244175d20c5a884ae3b5b5a2.jpg"),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "TucanBot",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: chatProvider.getMessages().length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String type = chatProvider.getMessages()[index].messageType;
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (type == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    // alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (type == "receiver"
                            ? Colors.grey.shade200
                            : Colors.blue[200]),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        chatProvider.getMessages()[index].messageContent,
                        //'hola mundo',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: textEditor,
                      onChanged: (value) => message = value,
                      decoration: const InputDecoration(
                          hintText: "Escribe un Mensaje...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    onPressed: () {
                      context
                          .read<ProviderSocket>()
                          .sendMessage(userId, message);
                      context.read<ChatProvider>().sendMessage(message);
                      textEditor.text = '';
                    },
                    child: const Icon(
                      Icons.send,
                      color: Color.fromARGB(255, 36, 21, 21),
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
