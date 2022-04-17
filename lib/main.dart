import 'package:flutter/material.dart';
import 'package:onsite_tracking/screens/login.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'provider/visits_provider.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/task_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (ctx) {
          return AuthProvider();
        }
),
        ChangeNotifierProvider(create: (ctx){
          return VisitsProvider();

        })

      ],


        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Colors.orange,
            buttonColor: Colors.red,
            appBarTheme: AppBarTheme(
              color: Colors.orange
            ),
            buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue
            ),
            buttonBarTheme: ButtonBarThemeData(
              buttonTextTheme: ButtonTextTheme.accent
            )

            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
          ),

          initialRoute: LoginScreen.routeName,
          routes:{

           HomeScreen.routeName :(ctx)=> HomeScreen(),
            LoginScreen.routeName :(ctx)=> LoginScreen(),
            ListScreen.routeName :(ctx)=> ListScreen(),


        }),
    );
    }

}
