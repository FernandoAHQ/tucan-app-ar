import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sockets.dart';

class EntryDisplay extends StatelessWidget {
  const EntryDisplay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProviderSocket socket = Provider.of<ProviderSocket>(context);


    return GestureDetector(
      child: Container(
        color: Color.fromARGB(255, 194, 193, 193),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: socket.entry ? 
     const Center(
       child: Icon(Icons.check_circle, color: Colors.green, size: 280.0,),
     )
    :
      const Center(
       child: Icon(Icons.block, color: Colors.red, size: 280.0,),
     ),
      ),
     onTap: (){
       Navigator.pop(context);
     },
    );
  }
}