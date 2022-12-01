import 'package:flutter/material.dart';
import '../config/palette.dart';

import '../models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard(this.article,  { Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Divider(thickness: 10.0, height: 15.0,),
        FadeInImage.assetNetwork(
          placeholder: 'assets/images/ImagePlaceholder.jpg',
          image: article.image),
       Padding(padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.category, style: const TextStyle(color: Palette.tecGreyLight, fontSize: 12.0),),
        Text(article.title, style: const TextStyle(color: Palette.darkGrey, fontSize: 18.0, fontWeight: FontWeight.bold),),
        Text(article.description, style: const TextStyle(color: Palette.tecGrey, fontSize: 14.0),),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children:  [
        //     MaterialButton(onPressed: ()=>{  Navigator.pushNamed(context, '/article', arguments: article)},
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        //     color: Palette.tecBlue,
        //     child: const Text("Ver más", style: TextStyle(color: Colors.white, fontSize: 14.0,),)
        //     )
        //   ],
        // ),
          ],
        ),),
      ],
    );
  }
}