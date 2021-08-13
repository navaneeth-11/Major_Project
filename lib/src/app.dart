import 'package:flutter/material.dart';
import 'package:majorproject/src/screens/login.dart';

// ignore: import_of_legacy_library_into_null_safe
//import 'package:splashscreen/splashscreen.dart';
import 'package:splashscreen/splashscreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      title: 'Login App',
      theme: ThemeData(  
        accentColor: Colors.orange,
        primarySwatch: Colors.blue
      ),
      home: Splash2(),
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.blue[100],
      seconds: 6,
      navigateAfterSeconds: new LoginScreen(),
      title: new Text('   WELCOME \n TIC-TAC-TOE',textScaleFactor: 2,),
      
      loadingText: Text("Loading.."),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}

class rules extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RULES TO PLAY'),
       
       ),
       body: ListView(children: [
         Text("1. Play occurs on a 3 by 3 grid of 9 empty squares.\n",style: TextStyle(fontSize: 20,)),
         Text("2. Two players alternate4. If the spaces are all filled and there is no winner, the game ends in a draw. marking empty squares, the first player marking Xs and the second player marking Os.\n",style: TextStyle(fontSize: 20,)),
        Text("3. If one player places three of the same marks in a row, that player wins.\n",style: TextStyle(fontSize: 20,)),
        Text("4. If the spaces are all filled and there is no winner, the game ends in a draw.",style: TextStyle(fontSize: 20,)),
       ],),
      
    );
  }
}
