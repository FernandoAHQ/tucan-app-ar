import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart';
import '../models/article.dart';
import '../models/location.dart';
import '../models/article.dart';
import '../services/httpService.dart';

class ProviderLocations with ChangeNotifier {
  FlutterTts tts = FlutterTts();

  List<Location> articles = [];
  Location currentLocation = Location(
      sId: "",
      name: "",
      horario: "",
      images: [
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.es%2Fpin%2F555420566554110894%2F&psig=AOvVaw1GKWS9lLoYmei6G-ZMNQyN&ust=1653687501153000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCPj1uJKQ_vcCFQAAAAAdAAAAABAD"
      ],
      description: "",
      map:
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.es%2Fpin%2F555420566554110894%2F&psig=AOvVaw1GKWS9lLoYmei6G-ZMNQyN&ust=1653687501153000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCPj1uJKQ_vcCFQAAAAAdAAAAABAD",
      body: "");

  Future loadLocation(String id) async {
    currentLocation = Location(
        sId: "",
        name: "",
        horario: "",
        images: [
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.es%2Fpin%2F555420566554110894%2F&psig=AOvVaw1GKWS9lLoYmei6G-ZMNQyN&ust=1653687501153000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCPj1uJKQ_vcCFQAAAAAdAAAAABAD"
        ],
        description: "",
        map:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.es%2Fpin%2F555420566554110894%2F&psig=AOvVaw1GKWS9lLoYmei6G-ZMNQyN&ust=1653687501153000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCPj1uJKQ_vcCFQAAAAAdAAAAABAD",
        body: "");

    final Response response;

    response = await HTTPService().requestLocation(id);
    print('GET LOCATION: ' + response.statusCode.toString());

    //  print(response.statusCode);
    if (response.statusCode == 201) {
      final Map data = jsonDecode(response.body);

      //     print(data['articles'][0]);
      currentLocation = Location(
        sId: (data['location']['_id']).toString(),
        name: (data['location']['name']).toString(),
        description: (data['location']['description']).toString(),
        body: (data['location']['body']).toString(),
        images: (data['location']['images']),
        map: (data['location']['map']).toString(),
        horario: (data['location']['horario']).toString(),
      );
//        categories = parsedData['categories'];

      notifyListeners();
    } else {
      print("COULDNT LOAD");
    }

    //  sayInfo();
    notifyListeners();
  }

  void speak(String text) async {
    print('SPEAKING!!!------------>>>>>>>');
    await Future.delayed(Duration(seconds: 1));
    await tts.setLanguage('es-MX');
    await tts.setSpeechRate(0.6);
    await tts.setPitch(1);
    await tts.speak(text);
    //

    // isSpeaking = false;
  }

  void sayInfo() async {
    await Future.delayed(Duration(seconds: 3));
    speak(currentLocation.name + ". " + currentLocation.description);
    //speak(this.currentLocation.description);
  }
}
