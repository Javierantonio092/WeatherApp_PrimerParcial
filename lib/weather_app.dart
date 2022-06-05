import 'dart:html';
import 'dart:math';
import 'package:examen9a_parcial1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherApp createState() => _WeatherApp();
}

class _WeatherApp extends State<WeatherApp> {
  Random random = Random();
  int temperature = 0;
  int temperatureFahren = 4;
  String clima = "";
  String city = "";
  String country = "";
  int num = 0;

  @override
  void initState() {
    super.initState();
    randomTemperature();
    changeCity();
  }

  void changeCity() {
    setState(() {
      if (num == 0) {
        city = "Mérida";
        country = "Yucatán, México";
      }
      if (num == 1) {
        city = "Miami";
        country = "Florida, EUA";
      }
      if (num == 2) {
        city = "Rio de Janeiro";
        country = "Rio de Janeiro, Brasil";
      }
      if (num == 3) {
        city = "Toronto";
        country = "Ontario, Canadá";
      }
      if (num == 4) {
        city = "Venecia";
        country = "Véneto, Italia";
      }
      num++;
      if (num > 4) {
        num = 0;
      }
    });
  }

  void randomTemperature() {
    var min = -20;
    var max = 48;
    setState(() {
      temperature = min + random.nextInt(max - min);
      temperatureFahren = ((temperature * (9 / 5)) + 32).round().toInt();
    });
    if (temperature <= 10) {
      setState(() {
        clima = "Nevado";
      });
    }
    if (temperature >= 10 && temperature < 15) {
      setState(() {
        clima = "Tormenta";
      });
    }
    if (temperature >= 15 && temperature < 20) {
      setState(() {
        clima = "Lluvioso";
      });
    }
    if (temperature >= 20 && temperature < 24) {
      setState(() {
        clima = "Nublado";
      });
    }
    if (temperature >= 24 && temperature < 27) {
      setState(() {
        clima = "Ventoso";
      });
    }
    if (temperature >= 27 && temperature < 32) {
      setState(() {
        clima = "Soleado";
      });
    }
    if (temperature > 32) {
      setState(() {
        clima = "Caliente";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/$clima.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        '$city',
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$country',
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$temperature °C | $temperatureFahren °F',
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$clima',
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
