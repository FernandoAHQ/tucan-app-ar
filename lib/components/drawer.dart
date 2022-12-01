
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/palette.dart';
import '../providers/userData.dart';

class DrawerMenu extends Drawer {
  const DrawerMenu({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children:  [
            createMenuItem(title: "Inicio", icon: Icons.home, function: ()=>{print("HOME")}),
            createMenuItem(title: "AR", icon: Icons.qr_code, function: ()=>{
              Navigator.pushNamed(context, "/ar")
            }),
           
          ]
            ),
            Column(
              children:  [
            createMenuItem(title: "Log Out", icon: Icons.logout, 
                      function: ()=>{Provider.of<ProviderUserData>(context, listen: false).logout(),
                      Navigator.pushNamed(context, "/login")
                      }),
            const SizedBox(height: 20.0,)
          ]
            ),],
        ),
      ),
    );
  }

  GestureDetector createMenuItem({required String title, required IconData icon,  required function}) {
    return  GestureDetector(
      onTap: function,
      child: ListTile(
                contentPadding: const EdgeInsets.all(5),
                leading: Icon(icon, size: 32.0, color: Palette.tecBlue,),
                title: Text(title, style: const TextStyle(fontSize: 24.0, color: Palette.tecBlue),),
              ),
    );
  }


}