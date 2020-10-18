import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_bucket_list/adventure.dart';
import 'package:travel_bucket_list/bucketlistpage.dart';
import 'package:travel_bucket_list/countrypage.dart';
import 'package:travel_bucket_list/findadventure.dart';
import 'package:travel_bucket_list/temphome.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  int _currentindex=0;

  Widget callpage(int currentIndex){
    switch(currentIndex){
      case 0: return TempHome();
      case 1: return Adventure();
      //case 2: return CountryPage();
      case 2: return BucketListPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callpage(_currentindex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _currentindex,
          // unselectedItemColor: Colors.,
          selectedItemColor: Colors.tealAccent[700],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
              // color: Colors.tealAccent[700],
            ),
            // title: SizedBox.shrink(),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // Icons.map,
              Icons.place,
              // FontAwesomeIcons.map,
              size: 30.0,
            ),
            // title: SizedBox.shrink(),
            title: Text("Map"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // Icons.card_travel,
              Icons.airplanemode_active,
              size: 30.0,
            ),
            // title: SizedBox.shrink(),
            title: Text("Bucket")
          ),
        ],
        onTap: (index){
          setState(() {
            _currentindex=index;
          });
        }
      ),
    );
  }
}
