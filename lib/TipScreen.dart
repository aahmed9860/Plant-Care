import 'package:flutter/material.dart';
import 'Navigation.dart';
import 'tipDetails.dart';

class TipScreen extends StatefulWidget {
  const TipScreen({super.key});

  @override
  State<TipScreen> createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  final List<String> tipTitles=[
    'Health and Safety: Best Time to Water Your Plants',
    'Indoor Tip: Light Intake',
    'Plants in Pots: Check your Containers!',
    'Plants in Pots: Soil Quality',
  ];
  
  final List<String> tips = [
    'Tip 1: Watering your plants is best to do while the sun is out, so that there is less excess hydration overnight. This protects your plants from funguses and bacteria that grow well in excessive dampness!',
    'Tip 2: Make sure you\'re aware of how much light your plant needs, as some plants need lots of sun and some prefer partial light. This is especially true for indoor plants, as light can be easily manipulated by where they\'re placed indoors.',
    'Tip 3: For indoor plants, containers do matter! Some plants will keep growing their roots and have trouble with growth if they are unable to spread their roots in a small pot. As such, it\'s inportant to research which plants need what size containers.',
    'Tip 4: Soil quality is important. Ensure that the soil you have is filled with nutrients for '
  ];
  @override

 Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        title: const Text('Plant Diseases'),
        backgroundColor: Colors.amber,
      
      ),
      body: ListView.builder(

       itemCount: tipTitles.length,
       itemBuilder:(context,index){
          return ListTile(
              title: Text(tipTitles[index],
              style: const TextStyle(fontSize: 20)),
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TipDetails(tipTitles: tipTitles[index], tips: tips[index]),
                ),
              );
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 5),
              borderRadius: BorderRadius.circular(0),
              
            ),
          );
       },

      ),
    );
  }

}  
