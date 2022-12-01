import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/articlesData.dart';
import '../providers/chat_provider.dart';
import '../providers/locationsData.dart';
import '../providers/sockets.dart';
import '../providers/userData.dart';
import '../utils/route_generator.dart';
import 'config/palette.dart';
import 'package:flutter/services.dart';


void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderSocket>( create: (context) => ProviderSocket()),
        ChangeNotifierProvider<ProviderUserData>( create: (context) => ProviderUserData()),
        ChangeNotifierProvider<ProviderArticles>( create: (context) => ProviderArticles()),
        ChangeNotifierProvider<ProviderLocations>( create: (context) => ProviderLocations()),
        ChangeNotifierProvider<ChatProvider>( create: (context) => ChatProvider()),     
      ],
      child: MaterialApp(
        title: 'TucanApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Palette.scaffold
        ),
        
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
