import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travel_bucket_list/globalvars.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  var resultlist=[];
  final myController = TextEditingController();

  textListener() {
    String searchquery= Uri.encodeFull(myController.text);
    Future<void> autocomplete() async {
      final response = await http.post(
        "https://api.locationiq.com/v1/autocomplete.php?key=3e99caae894da7&q=${searchquery}&format=json",
      );
      print("called");
      var decodedResponse = json.decode(response.body);
      print(response.body);
      resultlist=[];
      for(int i=0;i<decodedResponse.length;i++){
        var temp=[];
        temp.add(decodedResponse[i]["display_place"].toString());
        temp.add(decodedResponse[i]["address"]["country"].toString());
        resultlist.add(temp);
        //print("place name-> "+decodedResponse[i]["display_place"].toString());
        //print("country-> "+decodedResponse[i]["address"]["country"].toString());
      }

      setState(() {
        print(resultlist);
      });
    }
    autocomplete();
    //print("Current Text is ${myController.text}");
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(textListener);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:Builder(
        builder: (BuildContext context)
        {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                        size: 22,
                      ),
                      color: Colors.tealAccent[700],
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 7,),
                    Container(
                      width: 260,
                      //margin: EdgeInsets.fromLTRB(12.0,48.0,20.0,0.0),
                      child: TextField(
                        controller: myController,
                        onChanged: (text) {
                          print("Text $text");
                        },
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: 'Search',
                          contentPadding: EdgeInsets.only(left: 20, top: 2),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.tealAccent[700],
                          ),
                          hintStyle: TextStyle(
                            fontSize: 17.0,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.grey[100],
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.grey[100],
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 650,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: resultlist.map((i){
                      return ListTile(
                        leading: Icon(
                          Icons.location_on,
                        ),
                        title: Text(i[0]),
                        subtitle: Text(i[1]),
                        trailing: Container(
                          height: 35,
                          width: 35,
                          color: Colors.tealAccent[700],
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                var place = [i[0], i[1], 0,"assets/images/India.jpg"];
                                GlobalVariables.bucketlist.add(place);
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                          Icons.airplanemode_active
                                      ),
                                      SizedBox(width: 10),
                                      Text('Added to Bucket List'),
                                    ],
                                  ),
                                ));
                              },
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        }
      )
    );
  }
}
