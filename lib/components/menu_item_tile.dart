import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/item.dart';

class ItemTile extends StatelessWidget {
  Item item;
   ItemTile({required this.item, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
      children: [
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/ImagePlaceholder.jpg',
            image: item.image),
           Padding(padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.price, style: const TextStyle(color: Palette.tecGreyLight, fontSize: 16.0),),
        Text(item.name, style: const TextStyle(color: Palette.darkGrey, fontSize: 32.0, fontWeight: FontWeight.bold),),
       // Text(article.description, style: const TextStyle(color: Palette.tecGrey, fontSize: 14.0),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            MaterialButton(onPressed: ()=>{  //Navigator.pushNamed(context, '/article', arguments: article)
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
            color: Colors.green,
            child: Icon(Icons.shop, color: Colors.white, size: 14.0,),
//            const Text("Ver más", style: TextStyle(color: Colors.white, fontSize: 14.0,),)
            )
          ],
        ),

          ],
        ),),
        SizedBox(height: 15.0,),
      ],
    ),
      ),
    );
  }
}