import 'package:flutter/material.dart';
import 'package:flutter_application_30/model/aliment.dart';

class Aliments {
  static List<Aliment> aliments = [
    Aliment(
        name: "Dunkin Donut",
        background: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFFD8183), Color(0xFFFB425A)],
        ),
        subtitle: "Strawberry Frosted",
        image: "assets/images/donut.svg",
        bottomImage: "assets/images/bottom_donut.svg",
        totalCalories: 420.0,
        runTime: 47.0,
        bikeTime: 45.0,
        swimTime: 41.0,
        workoutTime: 52.0),
    Aliment(
        name: "Burger",
        background: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFF8C08E), Color(0xFFFDA65B)],
        ),
        subtitle: "McDonald's: Big Mac",
        image: "assets/images/burger.svg",
        bottomImage: "assets/images/bottom_burger.svg",
        totalCalories: 560.0,
        runTime: 112.0,
        bikeTime: 69.0,
        swimTime: 61.0,
        workoutTime: 101.0),
    Aliment(
        name: "Ice Cream",
        background: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF6CD8F0), Color(0xFF6AD89D)],
        ),
        subtitle: "Vanilla Ice Cream",
        image: "assets/images/ice_cream.svg",
        bottomImage: "assets/images/bottom_ice_cream.svg",
        totalCalories: 210.0,
        runTime: 36.0,
        bikeTime: 31.0,
        swimTime: 25.0,
        workoutTime: 41.0),
    Aliment(
        name: "Pizza",
        background: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFEE0979), Color(0xFFFF6A00)],
        ),
        subtitle: "Chorizo Pizza",
        image: "assets/images/pizza.svg",
        bottomImage: "assets/images/bottom_pizza.svg",
        totalCalories: 238.0,
        runTime: 40.0,
        bikeTime: 35.0,
        swimTime: 30.0,
        workoutTime: 50.0),
    Aliment(
        name: "Cake",
        background: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFFBD3E9), Color(0xFFBB377D)],
        ),
        subtitle: "Cherry Cake",
        image: "assets/images/cake.svg",
        bottomImage: "assets/images/bottom_cake.svg",
        totalCalories: 195.0,
        runTime: 33.0,
        bikeTime: 29.0,
        swimTime: 24.0,
        workoutTime: 39.0),
  ];
}