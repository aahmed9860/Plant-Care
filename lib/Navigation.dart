import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant_care/login/LoginPage.dart';
import 'homeScreen.dart';
import 'WateringSchedule.dart';
import 'inputPlants.dart';
import 'TipScreen.dart';
import 'Plant Diseases/PlantDiseases.dart';
import 'ViewPlants.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) { //Navigation Drawer
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context), //header builder
            buildMenuItems(context), //items builder
          ],
        )
      )

    );
  }
  Widget buildHeader(BuildContext context) { //If we want to add a header we can, this is here for that
    return Container( 
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),

    );
  }
  Widget buildMenuItems(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
      children:[
        ListTile(
          tileColor: Colors.blueGrey,
          iconColor: Colors.black87,
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {
    
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=> const HomeScreen(),
            ),
            );
          }
        ),
        const Divider(color:Colors.black54),
         ListTile(
          tileColor: Colors.grey,
          iconColor: Colors.black87,
          leading: const Icon(Icons.new_label),
          title: const Text('Login'),
          onTap: () {
               Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=> LoginPage(),
          )
          );
          },
        ),
        const Divider(color:Colors.black54),
        ListTile(
          tileColor: Colors.blue,
          iconColor: Colors.black87,
          leading: const Icon(Icons.water),
          title: const Text('Watering Schedule'),
          onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=> const WateringSchedule(),
          )
          );
          }
        ),
         const Divider(color:Colors.black54),
         ListTile(
          iconColor: Colors.black87,
          tileColor: Colors.amber,
          leading: const Icon(Icons.lightbulb),
          title: const Text('Tips'),
          onTap: () {
               Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=> const TipScreen(),
          )
          );
          },
        ),
         const Divider(color:Colors.black54),
         ListTile(
          tileColor: Colors.purple,
          iconColor: Colors.black87,
          leading: const Icon(Icons.details_sharp),
          title: const Text('Plant Diseases'),
          onTap: () {
               Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=> PlantDiseases(),
          )
          );
          },
        ),
         const Divider(color:Colors.black54),
         ListTile(
          tileColor: Colors.pink,
          iconColor: Colors.black87,
          leading: const Icon(Icons.new_label),
          title: const Text('Input New Plants'),
          onTap: () {
               Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=> const InputPlants(),
          )
          );
          },
        ),
        const Divider(color: Colors.black54),
         ListTile(
          tileColor: Colors.red,
          iconColor: Colors.black87,
          leading: const Icon(Icons.view_agenda),
          title: const Text('View Your Plants'),
          onTap: () {
               Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=> ViewPlants(),
          )
          );
          },
        ),
      ]

      ),
    );
  }
}