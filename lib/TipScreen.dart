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
    'Dirt Matters!: Soil Quality',
    'Checking Hydration Levels: The Dip Finger Test',
    'Temperature Control: Consistency is Key',
    'Watering Ways: Underwatering is Safer Than Overwatering!',
    'Getting Plucky: Pruning and It\'s Benefits',
    'Reduce Reuse: Recycling Organic Waste',
    'Dusty and Musty: Keeping Plants Clean',
    'Weed Wrangler: Keping Your Plants from Choking',
  ];
  
  final List<String> tips = [
    'Watering your plants is best to do while the sun is out, so that there is less excess hydration overnight. This protects your plants from funguses and bacteria that grow well in excessive dampness!',
    'Make sure you\'re aware of how much light your plant needs, as some plants need lots of sun and some prefer partial light. This is especially true for indoor plants, as light can be easily manipulated by where they\'re placed indoors.',
    'For indoor plants, containers do matter! Some plants will keep growing their roots and have trouble with growth if they are unable to spread their roots in a small pot. As such, it\'s inportant to research which plants need what size containers.',
    'Soil quality is important. Ensure that the soil you have is filled with nutrients for ',
    'Only water your plants when the top two inches of soil feel dry. You can check this with your finger, if your finger is dry after putting it in soil, water your plant. If not, don\'t water',
    'Plants need consistent living conditions. If growing indoors, it\'s vital to have a consistent temperature.',
    'While it may seem like a plant would suffer more from no water, plants survive better and stay healthier from underwatering than overwatering. Overwatering hurts your plant and can lead to increased chance of diseases.',
    'Pruning can help promote plant growth, so if you see wilted or withering leaves/branches, it might be best to cut them back to promote future growth.',
    'A lot of kitchen trash can be used for compost such as coffee grounds, egg shells or banana peels. These can supply your plants with additional nutrients and give dual purpose to food waste.',
    'Plants that gather dust can have a difficult time photosynthesizing due to obstruction from light. For indoor plants, ensure that you take the time to dust the leaves occasionally.',
    'Look out for weeds growing near your plants. When weeding, ensure you grab from the base to get the roots. Also keep an eye on bugs and funguses for disease control.',
  ];
  @override

 Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        title: const Text('Tips for Plant Care'),
        backgroundColor: Colors.amber,
      
      ),
      body: ListView.builder(

       itemCount: tipTitles.length,
       itemBuilder:(context,index){
          return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text((index+1).toString()),
              ),
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
              side: const BorderSide(color: Colors.black, width: 5),
              borderRadius: BorderRadius.circular(0),
              
            ),
          );
       },

      ),
    );
  }

}  
