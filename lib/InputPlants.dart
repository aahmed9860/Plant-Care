import 'package:flutter/material.dart';
import 'Navigation.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class InputPlants extends StatefulWidget {
  const InputPlants({super.key});

  @override
  State<InputPlants> createState() => _InputPlantsState();
}

class _InputPlantsState extends State<InputPlants> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();
  final _wateringScheduleController = TextEditingController();
  File? _image;
  final List<String> _sampleImage = [
    'assets/images/plantPictures/rose.jpg',
    'assets/images/plantPictures/hydrangea.jpg',
    'assets/images/plantPictures/lily.jpg',
    'assets/images/plantPictures/azelia.jpg',
    'assets/images/plantPictures/dahlia.jpg',
    'assets/images/plantPictures/tulip.jpg',
  ];
  String? _selectedImage;
  
  void initState(){
    super.initState();
    _selectedImage = _sampleImage[0];
  }

  Future pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  void pickSampleImage(String imagePath) {
    setState((){
      _selectedImage = imagePath;
    });
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
      drawer: const Navigation(),
      appBar: AppBar(
        title: const Text('Input Plants'),
        backgroundColor: Colors.pink,
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
                decoration: const InputDecoration(labelText: 'Watering Schedule (hours)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please how often the plant needs to be watered in the format dd:hh:ss';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _image  != null ? Image.file(_image!) : Text('No image selected.'),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text('Pick an Image'),
              ),
              const SizedBox(height:20),
             ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                   title:  const  Text('Select Image'),
                  content: Container(
                    width: double.maxFinite,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: _sampleImage.length,
                      itemBuilder: (context, index) {
                        final imagePath = _sampleImage[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            pickSampleImage(imagePath);
                          },
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
                child: const Text('Sample Images'),
              ) ,
              const SizedBox(height: 20),
              _selectedImage != null
              ?Image.asset(
                _selectedImage!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,

              ):
              const Text("No image selected"),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Here, you would usually send the data to a database or a state management solution
                    // For now, just pop the screen
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
}