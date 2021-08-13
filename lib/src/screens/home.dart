import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majorproject/src/screens/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart'as login;
class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
       appBar: AppBar(title: Text('Login'),
       
       ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(height: 80,
             color: Colors.blue,
             alignment: Alignment.center,
             child: ListTile(
              leading:Icon(Icons.account_circle) ,
              title:  Text("HI,WELCOME"),
              trailing: Icon(Icons.arrow_right),
              onTap:(){
                 Fluttertoast.showToast(
                        msg: "OPENING ACCOUNT DETAILS...",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16.0
                        
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>secondscreen() )); 
                    
              },
            )),
          
           
            Divider(thickness: 2,color: Colors.blue,),
            ListTile(
               title: Text("HELP & SUPPORT"),
               leading:Icon(Icons.call),
               onTap: ()  async {
               Fluttertoast.showToast(
                        msg: "REDIRECTING...",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.blue,
                        textColor: Colors.black,
                        fontSize: 16.0
                    );
              },
      ),
            Divider(thickness: 2,color: Colors.blue,),
            ListTile(
              title: Text("RULES"),
              leading:Icon(Icons.rule),
              onTap:(){
                 
                    
              } ,
            ),
            Divider(thickness: 2,color: Colors.blue,),
            ListTile(
              title: Text("LOGOUT"),
              leading:Icon(Icons.logout),
              onTap: (){
                

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("No"),
    onPressed:  () {
      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>LoginScreen() ));
      
    },
  );
  Widget continueButton = TextButton(
    child: Text("Yes,Logout"),
    onPressed:  () {
       auth.signOut();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
       
                    
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    
    content: Text("Are you sure you want to logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

              },
            ),
            Divider(thickness: 2,color: Colors.blue,),
            
          ],
        ),
      ),
      body: Center(child: ElevatedButton(child: Text('Logout'),onPressed: (){
        auth.signOut();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      },),),
    );
  }
}