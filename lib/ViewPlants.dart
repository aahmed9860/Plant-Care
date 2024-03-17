import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewPlants extends StatefulWidget {
  const ViewPlants({Key? key}) : super(key: key);

  @override
  State<ViewPlants> createState() => _ViewPlantsState();
}

class _ViewPlantsState extends State<ViewPlants> {
  late List<String> imageAssetNames;

  @override
  void initState() {
    super.initState();
    loadAssets();
  }

  Future<void> loadAssets() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final imageAssetNames = manifestMap.keys.where((String key) => key.startsWith('asset/') && key.endsWith('.jpg')).toList();
    setState(() {
      this.imageAssetNames = imageAssetNames;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // ignore: unnecessary_null_comparison
    if (imageAssetNames == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('View Plants'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: CircularProgressIndicator(), // Show loading indicator while fetching assets
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('View Plants'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: imageAssetNames.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                Image.asset(
                  imageAssetNames[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                ListTile(
                  title: Text('Plant ${index + 1}'),
                  subtitle: Text('Description of ${imageAssetNames[index]}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
