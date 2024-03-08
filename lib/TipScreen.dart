import 'package:flutter/material.dart';
import 'Navigation.dart';
import 'tip_list.dart';

class TipScreen extends StatefulWidget {
  const TipScreen({super.key});

  @override
  State<TipScreen> createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        title: const Text('Tip Screen'),
        backgroundColor: Colors.amber,
      ),
      /*
        body: ListView.builder(
      
       itemCount: tips.length,
     
       itemBuilder:(context,index){
          return ListTile(
              title: Text(tips[index]),
            onTap:(){
             
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.amberAccent, width: 1.5),
              borderRadius: BorderRadius.circular(10),
              
            ),
          );
       },

      ),
        */
    );
  }
}