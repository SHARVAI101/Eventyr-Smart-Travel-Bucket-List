import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travel_bucket_list/adventure.dart';
import 'package:travel_bucket_list/countrypage.dart';

class FindAdventure extends StatefulWidget {
  @override
  _FindAdventureState createState() => _FindAdventureState();
}

class _FindAdventureState extends State<FindAdventure> {
  var _message="SEARCH";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height:70,),
            Text(
              "Find an Adventure",
              style: TextStyle(
                fontSize: 45
              ),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
              )
            ),
            RaisedButton(
              onPressed: (){
                var lat, lon;
                Future<bool> findLocation() async {
                  final response = await http.post(
                    "https://eu1.locationiq.com/v1/search.php?key=3e99caae894da7&q=Fredvang%20Bridges&format=json",
                  );

                  var decodedResponse = json.decode(response.body);
                  print(response.body);
                  print("decoded Response latitude-> "+decodedResponse[0]["lat"].toString());
                  print("decoded Response longitude-> "+decodedResponse[0]["lon"].toString());
                  lat=decodedResponse[0]["lat"];
                  lon=decodedResponse[0]["lon"];
                  // setState(() {
                  //   _message=decodedResponse[0]['lat'].toString();
                  // });
                  // print(_message);
                  return true;
                  // return decodedResponse;
                }

                Future<void> findCountry() async {
                  //first we get the latitude and longitude using findLocation
                  var resp=await findLocation();

                  if(resp==true){
                    print(lon);
                    print("https://eu1.locationiq.com/v1/reverse.php?key=3e99caae894da7&lat=$lat&lon=$lon&format=json");
                    // this means, we now have the latitude and longitude
                    final response = await http.post(
                      "https://eu1.locationiq.com/v1/reverse.php?key=3e99caae894da7&lat=$lat&lon=$lon&format=json",
                    );

                    var decodedResponse = json.decode(response.body);
                    print(response.body);
                    print("country->"+decodedResponse["address"]["country"].toString());
                    setState(() {
                      _message=decodedResponse["address"]["country"].toString();
                    });
                    // print(_message);
                  }
                }
                findCountry();
              },
              // color: Colors.blueGrey[600],
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20)
              ),
              child: Text(
                'SEND REQUEST',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){
                //Get.off(FindAdventure());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Adventure()),
                );
              },
              // color: Colors.blueGrey[600],
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20)
              ),
              child: Text(
                'Open Map',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){
                //Get.off(FindAdventure());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountryPage()),
                );
              },
              // color: Colors.blueGrey[600],
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20)
              ),
              child: Text(
                'Open Country Page',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
