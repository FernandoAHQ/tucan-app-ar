import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import '../config/constants.dart';
import '../providers/userData.dart';

import '../models/authData.dart';
import 'chat_provider.dart';

enum ServerStatus { Online, Offline, Connecting }

class ProviderSocket with ChangeNotifier {

  bool entry = false;


  var _serverStatus = ServerStatus.Offline;
  late Socket socket;
  late AuthData user;
    String adminId = '621c19019cef936ea47c9645';


  void disconnectFromServer() {
    socket.disconnect();
  }

  Future connectToServer(BuildContext _context) async {
    user = _context.read<ProviderUserData>().data;

    String token = await _context.read<ProviderUserData>().getToken();
    
    print('TOKEN: $token');

    try {
      // Configure socket transports must be sepecified
      socket = IO.io(
          Constant.baseUrl,
          IO.OptionBuilder()
              .setTransports(['websocket'])
              .enableForceNew()
              .disableAutoConnect()
              .setQuery({'accessToken': 'Bearer $token'})
              .build());

      // Connect to websocket
      socket.connect();


      

      // Handle socket events
      socket.onConnect((_) {
          print("CONNECTED TO THE SERVER XDDD");
      });

      socket.on('resp', (data){
        entry = data['status'];
        //print("RESP: "+ data['status'].toString());
       // _context.read<ProviderSocket>().entry = true;
      });

      socket.onReconnectError((data) => print("RECONNECT ERROR"));
      socket.onReconnectFailed((data) => print("RECONNECT FAILED"));
      socket.on('event', (data) => null);

      socket.onDisconnect((_) {
        print('disconnect');
        _serverStatus = ServerStatus.Offline;
        if (_context.read<ProviderUserData>().data.isLogged()) {
          //   print(_context.read<ProviderUserData>().data.isLogged());
          // connectToServer(_context);
        }
      });

      socket.on('fromServer', (_) => print(_));
    } catch (e) {
      print(e.toString());
    }

    socket.on(
        "reports-list",
        (data) => handleReportList(
            _context, data)); //print("\n\n\n" + data[0]['title'].toString()));
 
    socket.on('messageResponse', (_) {
      print(_['message']);
      _context.read<ChatProvider>().addResponse(_['message']);
      notifyListeners();
    });
 
  }
  



  // Send Location to Server
  sendLocation(Map<String, dynamic> data) {
    socket.emit("location", data);
  }

  handleReportList(BuildContext context, data) async {
    if (data != null) {
     // context.read<ProviderServices>().readServices(data);
    }
    notifyListeners();
  }

  void sendEntry(String qr){
     LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(qr);
    socket.emit('validar', {
        'checador': lines[0],
        'value': lines[1],
        'from':  user.user!.sId!
    });
  }

  // Send update of user's typing status
  sendTyping(bool typing) {
    socket.emit("typing", {
      "id": socket.id,
      "typing": typing,
    });
  }

  // Listen to update of typing status from connected users
  void handleTyping(Map<String, dynamic> data) {
    print(data);
  }
 

  void sendReport({
    required String title,
    required String description,
    required String category,
  }) {
    var report = {
      'to': '621c19019cef936ea47c9645',
      'from': user.user?.sId,
      'report': {
        'title': title,
        'description': description,
        'category': category
      }
    };
  
    socket.emit('depto-report', report);
    //    print(report);
  }




  void editReport({
    required String title,
    required String description,
    required String category,
    required String id
  }) {
    var report = {
      'to': adminId,
      'from': user.user?.sId,
      'report': {
        '_id' : id,
        'title': title,
        'description': description,
        'category': category
      }
    };

    socket.emit('edit-report', report);
    //    print(report);
  }


 


 
  void sendMessage(String fromUserId, String message) {

      socket.emit('messageClient', {
      "from": fromUserId,
      "message": message,
    });
    print('EMITING MESSAGE: ' + message);
  }

    // void passContext(BuildContext context){
    //   _context = context;
    // }
}
