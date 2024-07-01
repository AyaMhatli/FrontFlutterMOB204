import 'package:flutter/material.dart';
import 'package:front_flutter/screens/home_screen.dart';
import 'package:front_flutter/screens/login_screen.dart';
// import 'package:front_flutter/screens/server_screen.dart';
//import 'package:my_flutter_app/screens/register_screen.dart';
import 'screens/edit_profile_screen.dart';
/*import 'services/api_service.dart';*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    /*   title: 'Flutter Laravel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),*/
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        // '/': (context) => ServerScreen(),
      //  '/server-screen': (context) => ServerScreen(),

        '/home': (context) => HomeScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
      },
    );
  }
}
