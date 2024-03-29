import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantcare/database/database_helper.dart';
import 'package:plantcare/database/plant_model.dart';

class InputPlants extends StatefulWidget {
  const InputPlants({Key? key}) : super(key: key);

  @override
  _InputPlantsState createState() => _InputPlantsState();
}

class _InputPlantsState extends State<InputPlants> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();
  final _wateringScheduleController = TextEditingController();
  File? _image;

  List<String> plantPictures = [
    'azelia.jpg',
    'dahlia.jpg',
    'hydrangea.jpg',
    'lily.jpg',
    'rose.jpg',
    'tulip.jpg'
  ];

  Future pickImage(String imageName) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _speciesController.dispose();
    _wateringScheduleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Plants'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Plant Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the plant name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _speciesController,
                decoration: const InputDecoration(labelText: 'Species'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the species';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _wateringScheduleController,
                decoration:
                    const InputDecoration(labelText: 'Watering Schedule (hours)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the watering schedule';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _image != null ? Image.file(_image!) : Text('No image selected.'),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Select a Plant Picture'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: plantPictures
                                .map(
                                  (imageName) => ListTile(
                                    title: Text(imageName),
                                    onTap: () {
                                      pickImage(imageName);
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Pick an Image'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _savePlant();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _savePlant() async {
    final name = _nameController.text;
    final species = _speciesController.text;
    final wateringSchedule = _wateringScheduleController.text;
    final image = _image != null ? _image!.path : null;

    final newPlant = Plant(
      plantId: '', 
      plantName: name,
      plantWateringTime: int.parse(wateringSchedule),
      plantImage: image ?? '',
      plantSpecies: species,
    );

    final dbHelper = DatabaseHelper();
    await dbHelper.insertPlant(newPlant);
  }
}
