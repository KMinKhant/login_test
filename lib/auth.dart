import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_test/welcome.dart';

class Auther extends StatefulWidget {
  const Auther({super.key});

  @override
  State<Auther> createState() => _AutherState();
}

class _AutherState extends State<Auther> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder:(contex,snapshot){
        if(snapshot.hasData){
          return Welcome();
        }else{
          return AlertDialog(
            icon: Icon(Icons.local_convenience_store,size: 30,),
          );
        }
   } );
          }
}