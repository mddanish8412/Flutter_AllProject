import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class HomePage extends StatelessWidget{
  const HomePage({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Center(child:
      Lottie.asset('assets/loading.json'),

      ),

    );


  }
}