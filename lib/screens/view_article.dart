import 'dart:io';

import 'package:flutter/material.dart';
import '../config/palette.dart';
import '../models/article.dart';

class ViewArticle extends StatelessWidget {
  Article article;
  ViewArticle(this.article);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
     // appBar: AppBar(backgroundColor: Color.fromARGB(0, 27, 57, 106), elevation: 0.0,),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Palette.tecBlue,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(article.image, fit: BoxFit.cover,),
              ),
              expandedHeight: (MediaQuery.of(context).size.height * 0.3),
              pinned: true,
          ),
          SliverList(delegate: SliverChildListDelegate(
            [   
              const SizedBox(height: 40.0,),
                Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.category, style: const TextStyle(color: Palette.tecBlue, fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5.0,),
              Text(article.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
             // Text(article.date.toString(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          ],
          ),
        ),
        Container(
             padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.description + "\n", style: const TextStyle(color: Palette.tecGrey, fontSize: 16.0, fontWeight: FontWeight.normal),),
              Text(article.body, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),),
            ],
          )
        ),
              const SizedBox(height: 200.0),

        Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child:Image.network(article.image),

        ),
              const SizedBox(height: 800.0,)

            ]
          ))
        ],
      )// newMethod(context),
    );
  }

  SingleChildScrollView newMethod(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: <Widget>[
         Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(article.image)
            ),
          ),
          height: 350.0,
        ),
        Container(
          height: 350.0,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Palette.tecBlue.withOpacity(0.6),
                    Colors.white.withOpacity(0.0),
                  ],
                  stops: const [
                    0.0,
                    1.0
                  ])),
        )
      ]),  
        Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.category, style: const TextStyle(color: Palette.tecBlue, fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5.0,),
              Text(article.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5.0,),
              Text(article.description + "\n", style: const TextStyle(color: Palette.tecGrey, fontSize: 16.0, fontWeight: FontWeight.normal),),
              Text(article.body, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),)
    
            ],
          ),
        )
        ],
      ),
    );
  }
}