import 'package:appifysocial/models/models.dart';
import 'package:appifysocial/providers/contents.dart';
import 'package:appifysocial/screens/addpost.dart';
import 'package:appifysocial/screens/comment_screen.dart';
import 'package:appifysocial/screens/editpost.dart';
import 'package:appifysocial/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:appifysocial/config/palette.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'package:appifysocial/providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Contents())
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, child) => MaterialApp(
          title: 'Appify Social',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: Palette.scaffold),
          home: auth.isAuth?HomeScreen():FutureBuilder(
              future: auth.autoLogIn(),
              builder: (ctx, dataSnapShot) =>
              dataSnapShot.connectionState == ConnectionState.waiting
                  ? SplashScreen()
                  : Login()
          ),
          // home: HomeScreen(),
          routes: {
            HomeScreen.routeName:(context)=>HomeScreen(),
            SignUp.routeName:(context)=> SignUp(),
            Login.routeName:(context)=>Login(),
            AddPost.routeName:(context)=>AddPost(),
            CommentScreen.routeName:(context)=>CommentScreen(),
            EditPost.routeName:(context)=>EditPost()
          },
        ),
      ),
    );
  }
}
