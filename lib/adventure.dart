import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong/latlong.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Adventure extends StatefulWidget {
  @override
  _AdventureState createState() => _AdventureState();
}

class _AdventureState extends State<Adventure> {

  bool _darkmode=false; // 0 means darkmode off; 1 means darkmode on
  int counter=0; //counter for switch onchanged

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: new MapOptions(
          center: new LatLng(51.5, -0.09),
          zoom: 6.0,
        ),
        layers: [
          new TileLayerOptions(
              //urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              //subdomains: ['a', 'b', 'c'],
              //urlTemplate: "https://api.mapbox.com/styles/v1/sharvai101/ckeprilzn1ze11apdg00u5ym4/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hhcnZhaTEwMSIsImEiOiJja2VwbmZocTQzdnF5MnNsdDV1a3hmcGF1In0.jn75qR8gTdrZpy7cIvKlxQ",
              urlTemplate: (_darkmode==true)?"https://api.mapbox.com/styles/v1/sharvai101/ckeprilzn1ze11apdg00u5ym4/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hhcnZhaTEwMSIsImEiOiJja2VwbmZocTQzdnF5MnNsdDV1a3hmcGF1In0.jn75qR8gTdrZpy7cIvKlxQ":"https://api.mapbox.com/styles/v1/sharvai101/ckev14dyrakva19lqj0z9rzn9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hhcnZhaTEwMSIsImEiOiJja2VwbmZocTQzdnF5MnNsdDV1a3hmcGF1In0.jn75qR8gTdrZpy7cIvKlxQ",
              additionalOptions: {
                'accessToken':'pk.eyJ1Ijoic2hhcnZhaTEwMSIsImEiOiJja2VwbmZocTQzdnF5MnNsdDV1a3hmcGF1In0.jn75qR8gTdrZpy7cIvKlxQ',
              'id':'mapbox.mapbox-streets-v7',
            }
          ),
          new MarkerLayerOptions(
            markers: [
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(51.5, -0.09),
                builder: (ctx) =>
                new Container(
                  child: Icon(Icons.place, color: Colors.red[400],size: 40,),
                ),
              ),
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(52.5, -0.09),
                builder: (ctx) =>
                new Container(
                  child: Icon(Icons.place,color: Colors.green[400],size: 40,),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 250),
        child: RotatedBox(
          quarterTurns: 3,
          child: LiteRollingSwitch(
            //initial value
            value: false,
            textOn: 'DARK',
            textOff: 'LIGHT',
            colorOn: Colors.blueGrey[700],
            colorOff: Colors.yellow[700],
            iconOn: FontAwesomeIcons.solidMoon,
            iconOff: Icons.wb_sunny,
            textSize: 16.0,
            onChanged: (value) {
              if(counter>0){
                setState((){
                  if(_darkmode==false)
                    _darkmode = true;
                  else
                    _darkmode=false;
                  print(_darkmode);
                });
              }
              counter+=1;
              print("onchanged");
            },
          ),


        ),
      ),
    );
  }
}
