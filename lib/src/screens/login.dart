import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:majorproject/game/form.dart';
import 'package:majorproject/src/app.dart';

import 'package:majorproject/src/screens/home.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';
String _email="login", _password;
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('WELCOME'),),

      drawer: Drawer(
        child: Column(
          children: [
            Container(height: 80,
             color: Colors.blue,
             alignment: Alignment.center,
             child: ListTile(
              leading:Icon(Icons.account_circle) ,
              title:  Text(_email),
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
               title: Text("HELP & \n SUPPORT"),
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
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>rules() ));
                    
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
        _email="login";
                    
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
      body: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration( 
                filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2),),
                hintText: 'Email'
              ),
               onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
             filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
              hintText: 'Password(min.6 characters)'),
              
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
            ElevatedButton(
              style: ButtonStyle(            
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.blue)
    )
  )
  
),
              //color: Theme.of(context).accentColor,
              child: Text('Signin'),
              onPressed: (){
                  auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyFormPage()));
                  });
                  
            }),
            ElevatedButton( 
              style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.blue)
    )
  )
),
              //color: Theme.of(context).accentColor,
              child: Text('Signup'),
              onPressed: (){
                auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                });
                
              },
            )
          ])
        ],),
    );
  }
}


class secondscreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        title: Text("ACCOUNT",style:TextStyle(fontStyle: FontStyle.italic,fontWeight:FontWeight.bold),),
        
        
      ),
       body: ListView(children:<Widget>[
            
            SizedBox(height:50,),
            Icon(Icons.account_circle,size: 75 ,color: Colors.blue,),
            SizedBox(height:10,),
            Text("User:",style:TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,),
            Text(_email,style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,),
            ElevatedButton( 
              //color: Theme.of(context).accentColor,
              style: ElevatedButton.styleFrom(
       primary: Colors.blue, //background color of button
       side: BorderSide(width:2, color:Colors.blue), //border width and color
       elevation: 3,),
              child: Text('Donation'),
              onPressed: (){
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),

         ElevatedButton(child: Text('Logout'),
         style: ElevatedButton.styleFrom(
       primary: Colors.blue, //background color of button
       side: BorderSide(width:2, color:Colors.blue), //border width and color
       elevation: 3,),
         onPressed: (){
       // auth.signOut();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      },),
          ],
                 
        
            
       ), 
    );
  }
}



//razorpay

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int totalAmount=0;
  int phonenumber=99999999999;
  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void launchPayment() async {
    var options = {
      'key': 'rzp_test_CBVRPaPOr7wlHZ', //<-- your razorpay api key/test or live mode goes here.
      'amount': totalAmount * 100,
      'name': _email,
      'description': 'Donation',
      'prefill': {'contact': phonenumber, 'email': 'example@gmail.com'},
      
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'Error ' + response.code.toString() + ' ' + response.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: 'Payment Success ' + response.paymentId+'THANKS FOR DONATION',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Text("GATEWAY"),
      ),
      body: Container(
        height: 550,
	             /* decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/background5.png'),
	                  fit: BoxFit.fill
	                ),
        /* add child content here */
      ),*/
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter the amount to donate',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20
              ,fontStyle:FontStyle.italic)
            ),
            LimitedBox(
              maxWidth: 150.0,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                   filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2),),
                  hintText: 'Enter Amount',
                   hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 18,

                        ),
                ),
                onChanged: (val) {
                  setState(() {
                    totalAmount = num.parse(val);
                  });
                },
              ),
            ),
            SizedBox(height: 15.0),


            LimitedBox(
              maxWidth: 150.0,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                   filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2),),
                  hintText: 'Enter Phone number',
                   hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 18,

                        ),
                ),
                onChanged: (val) {
                  setState(() {
                    phonenumber = num.parse(val);
                  });
                },
              ),
            ),
            SizedBox(height: 15.0),



            ElevatedButton(
              child: Text('PAY NOW'),
              onPressed: () {
                launchPayment();
              },
            )
          ],
        ),
      ),

    );
  }
}