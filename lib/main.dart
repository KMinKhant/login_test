import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_test/welcome.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform);
 runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
   Body({
    super.key,
  });
  TextEditingController emaileditingcontroller=TextEditingController();
  TextEditingController psweditingcontroller=TextEditingController();

  void SinginUser() async{
await FirebaseAuth.instance.signInWithEmailAndPassword(
  email:emaileditingcontroller.text ,
   password: psweditingcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: [
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: TextField(
                   decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide:BorderSide(
                         color: Colors.grey
                       )
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.grey)
                     )
                   ),
                   controller:emaileditingcontroller ,
                 ),
               ),
               SizedBox(height: 20,),
                Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: TextField(
                   decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide:BorderSide(
                         color: Colors.amber
                       )
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.pink)
                     )
                   ),
                   controller:emaileditingcontroller ,
                 ),
               ),
              
              
               ElevatedButton(onPressed: (){
                SinginUser();
               }, child: Text('Login'))
            ],
        ),
      );
       }
    
  }
