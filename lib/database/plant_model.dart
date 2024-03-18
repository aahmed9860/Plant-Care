import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Plant {
  final String plantId;
  final String plantSpecies;
  final int plantWateringTime;
  final String plantImage;
  const Plant({required this.plantId, required this.plantSpecies, required this.plantWateringTime, required this.plantImage });

  Map<String, dynamic> toJson(Map<String, dynamic> map) => {
    
      'id': plantId,
      'species': plantSpecies,
      'wateringTime' : plantWateringTime,
      'image' : plantImage,
    };
  
}