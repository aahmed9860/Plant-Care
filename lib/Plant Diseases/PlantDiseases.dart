import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../Navigation.dart';
import 'DiseaseDetails.dart';

class ImageData{
  final String imagePath;
  
  ImageData({
    required this.imagePath,
  });
}

class PlantDiseases extends StatefulWidget {
   PlantDiseases({super.key});

  @override
  State<PlantDiseases> createState() => _PlantDiseasesState();
  }

  final List<String> diseases= [
  "Blight",
  "Powdery Mildew",
  "Downy Mildew",
  "Black Spot",
  "Citrus Canker",
  "Fusarium Wilt",
  "Apple Scab",
  "Gray Mold",
  "Root Rot",
  "Blossom End Rot",
  "Chlorosis",
  "Damping Off",
];
final List <String> symptoms =[
  "A bacterial disease that appears as yellow or red spots, sometimes accomponied with a type of yellow slime. If let spread, the bacteria can kill the entire plant or infect the seeds inside. ",
  "A fungal disease that affects the foliage of a plant. The fungus spreads airbirne spores that it is spread more easily when leaves are wet, ie. during the rain. There are different species of downy mildew that usually effect different plants but carrots, grapevines, roses, peas, and spinach are highly susceptible. Look for discolored blotches on the top side of the leaf and mold growths on the underside. This disease can stunt the plant's growth or even kill it.",
  "A common plant disease that is most commonly found among roses, but is not exclusive, as these spots also appear on other garrden plants. A fungal disease that causes black round spots to appear.",
  "Cankers are more of a symptom found on plants that can be caused by a variety of fungi and bacteria. They are a sign of infection and can kill branches or weaken the structural integrity.",
  "A fungal disease caused by a fungus found in the soil, Fusarium oxysporum. Infected plants will have their growth stunted and have their leaves turn a golden yellow, which will then lead to wilting, withering, and death. This can also kill seedlings if the soil is infected.",
  "Apple Scab is a fungal disease caused by Venturia inaequalis. It grows on diseased leaves in the winter and spreads spores in the spring. It shows in the form of black spots covering the skin of the apple. Most common in humid climates. ",
  "Gray Mold is a fungal disease caused by Botrytis cinerea. It is nrmally found on dying plant tissue, but can spread quickly to healthy plants. It usually causes a fuzzy coating on the surfaces of flower blossoms and fruits. ",
  "Symptoms of Root Rot",
  "Symptoms of Blossom End Rot",
  "Symptoms of Chlorosis",
  "Symptoms of Damping Off",
];
final List <String> cures =[
  "Cures of Blight",
  "Cures of Powdery Mildew",
  "Once infected, only prevention measures can be taken to reduce contagion. Picking off the infected leaves once symptoms arise is a solid method once identified. IF the fungus has taken over most of the plant, it's better to remove the plant and discard away from other plants. When watering, avoid watering at night, as the leaf wetness with lacking sunlight has a higher risk of spread. Crop rotaion can help if you suspect your soil has been infected with the spores.",
  "Cures of Black Spot",
  "Cures of Canker",
  "The most surefire way of preventing Fusarium Wilt is through removing infected plants from the area or using clean seeds when planting anew. Soil fungicides may be effective, but their are resistant subgroups in existence. Rotation is not usually effective as the infection is soil is known for living long periods of time.",
  "There are fungicides available to combat the growth of Venturia inaequalis, and many are considered safe. There are also a few species of apples that are resistant to apple scabs, though this is not consistent throughout all apples and even within species the levels differ, making it an unreliable method as oppesed to chemical resistance.",
  "Th best ways to prevent gray mold are found within regular plant care. Keeping your garden clean by removing infected plants and cleaning up fallen petals are a good start. Then, avoid overwatering and keeping leaves generally dry, as gray mold flourishes with high humidity.",
  "Cures of Root Rot",
  "Cures of Blossom End Rot",
  "Cures of Chlorosis",
  "Cures of Damping",
];

List<String> diseasePictures = [
  'assets/images/diseasePictures/blight.jpg',
  'assets/images/diseasePictures/powdery-mildew.jpg',
  'assets/images/diseasePictures/downy-mildew.jpg',
  'assets/images/diseasePictures/black-spot.jpg',
  'assets/images/diseasePictures/citrus-canker.jpg',
  'assets/images/diseasePictures/fusarium-wilt.jpg',
  'assets/images/diseasePictures/apple-scab.jpg',
  'assets/images/diseasePictures/gray-mold.jpg',
  'assets/images/diseasePictures/root-rot.jpg',
  'assets/images/diseasePictures/blossom-end-rot.jpg',
  'assets/images/diseasePictures/chlorosis.jpg',
  'assets/images/diseasePictures/damping-off.jpg'

];


class _PlantDiseasesState extends State<PlantDiseases> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        title: const Text('Plant Diseases'),
        backgroundColor: Colors.purple,
      
      ),
      body: ListView.builder(

       itemCount: diseases.length,
       itemBuilder:(context,index){
          return ListTile(
              title: Text(diseases[index],
              style: const TextStyle(fontSize: 20)),
              leading: Image.asset(diseasePictures[index]),
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiseaseDetails(diseaseName: diseases[index], diseaseSymptoms: symptoms[index], diseaseCure: cures[index]),
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
