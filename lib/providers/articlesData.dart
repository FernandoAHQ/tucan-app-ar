import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/article.dart';
import '../services/httpService.dart';

class ProviderArticles with ChangeNotifier {

    List<Article> articles = [];


      Future loadArticles() async {
    final Response response;
    
      response = await HTTPService().getArticles();
      print('GET ARTICLES: ' + response.statusCode.toString());

    //  print(response.statusCode);
  if (response.statusCode == 201) {
        final Map data = jsonDecode(response.body);
        
    //     print(data['articles'][0]);
        for(int i = 0; i < data['articles'].length; i++){
           Article newArticle = Article(
          sId:       (data['articles'][i]['_id']).toString(),
          title: (data['articles'][i]['title']).toString(),
          description: (data['articles'][i]['description']).toString(),
          body:    (data['articles'][i]['body']).toString(),
          image:    (data['articles'][i]['image']).toString(),
          category:    (data['articles'][i]['category']).toString(),
          
        );
        articles.add(newArticle);
       }
//        categories = parsedData['categories'];

         notifyListeners();
        }else{
          print("HISTORY NOT RECIEVED");
        }
         notifyListeners();

        print(articles.length.toString());
      }

    Future requestArticles() async {
    final response;
    print("requesting...");
    try {
      response = await HTTPService().getArticles();

      print(response.statusCode);
      print("recieved");
      if (response.statusCode == 201) {
        print("parsing...");
        final Map parsedData = jsonDecode(response.body);

        for(int i = 0; i < parsedData['articles'].length; i++){
          articles.add(Article.fromJson(parsedData['articles'][i]));
          print("Article Added");
        }
      notifyListeners();
      print(articles.length.toString() + "ARTS");
       
      }
    } catch (e) {
      notifyListeners();
      print(e);
    }
      notifyListeners();

  }

  List<Article> getArticles() {
    return articles;
  }

}