import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/articleCard.dart';
import '../components/drawer.dart';
import '../config/palette.dart';
import '../providers/articlesData.dart';
import '../providers/sockets.dart';
import '../screens/qr_scanner.dart';

import '../models/article.dart';
import '../providers/userData.dart';
import 'food.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String _name = "";
//List<Article> articles = [];

  List<Widget> _screens = [];

  @override
  void initState() {
    context.read<ProviderArticles>().loadArticles();
    context.read<ProviderSocket>().connectToServer(context);

    for (var i = 0; i < (5); i++) {
      //  articles.add( Article(description: "Recuerda que realizar la EVALUACIÓN es un REQUISITO para el próximo semestre.", sId: 1.toString(), body: "BODY", title: "EVALUACIÓN DOCENTE " + i.toString(), image: "IMAGE", category: "Actividades Escolares"));
    }
    _screens = [
      Column(children: [
        createHeader(context),
        const Expanded(child: ArticleListView())
        // buildListView(context))
      ]
          //            WelcomeHeader(name: _name),

          ),
      const Center(
        child: QRScanner(),
      ),
      const Food(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat_bubble),
        onPressed: () => Navigator.pushNamed(context, '/chat'),
      ),
      appBar: _createAppBar(context),
      drawer: const DrawerMenu(),
      body: _screens[_currentIndex],
      bottomNavigationBar: _createBottomNavigationBar(context),
    );
  }

  BottomNavigationBar _createBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: "",
        ),
      ],
    );
  }

  onTabTapped(int index) {
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  Widget buildListView(BuildContext context) {
    ProviderArticles provArts = Provider.of<ProviderArticles>(context);
    List<Article> articles = provArts.getArticles();
    print(articles.length.toString() + " Articles");
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        Article _article = articles.elementAt(index);

        return GestureDetector(
          child: ArticleCard(_article),
          onTap: () => print(_article.title),
        );
      },
    );
  }

  AppBar _createAppBar(BuildContext context) {
    String? img = context.read<ProviderUserData>().data.user?.image;
    return AppBar(
      shape: const Border(bottom: BorderSide(color: Palette.tecBlue, width: 4)),
      elevation: 0,
      // bottomOpacity: 0,
      actions: [
        ClipRRect(
          child: FadeInImage.assetNetwork(
            width: 35,
            height: 35,
            image:
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" ??
                    "",
            //    image: "",
            // context.read<ProviderUserData>().data.user?.image ?? "",
            placeholder: 'assets/images/profilePlaceholder.png',
          ),
          borderRadius: BorderRadius.circular(90),
        ),
        const SizedBox(
          width: 20.0,
        )
      ],
      backgroundColor: Palette.tecBlue,
    );
  }

  Row createHeader(BuildContext context) {
    String name = context.read<ProviderUserData>().data.user!.name!;
    List<String> names = name.split(" ");
    name = "";
    for (int i = 0; i < names.length; i++) {
      if (i == 2) name += "\n";
      name += names[i] + " ";
    }
    //context.read<ProviderSocket>().connectToServer(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 15.0,
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Jueves, 1 de Diciembre',
              style: TextStyle(
                  color: Palette.tecGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text("Bienvenido de regreso,\n" + name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w800)),
            const Text(
              //  context.read<ProviderUserData>().data.department?.name ??
              "",
              // style: h4Style,
            ),
          ],
        )
      ],
    );
  }
}

class ArticleListView extends StatelessWidget {
  const ArticleListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProviderArticles provArts = Provider.of<ProviderArticles>(context);
    List<Article> articles = provArts.getArticles();
    print(articles.length.toString());
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        Article _article = articles.elementAt(index);

        return GestureDetector(
          child: ArticleCard(_article),
          onTap: () =>
              Navigator.pushNamed(context, '/article', arguments: _article),
        );
      },
    );
  }
}
