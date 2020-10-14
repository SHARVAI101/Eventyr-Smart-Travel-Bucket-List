import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  /*void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
  }*/
  Widget build(BuildContext context) {
    return Scaffold(
      body:NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 350.0,
              floating: false,
              pinned: true,
              // backgroundColor: Colors.white,
              backgroundColor: Colors.tealAccent[700],
              // backgroundColor: Colors.teal[500],
              flexibleSpace: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  systemNavigationBarColor: Colors.white,
                  statusBarColor: Colors.transparent,
                ),
                child: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "JAPAN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27.0,
                    )
                  ),

                  background: ClipRRect(
                    // borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      'assets/images/fuji.jpg',
                      fit: BoxFit.cover,
                      height: 350,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              // SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bucket List',
                    style: TextStyle(
                      fontSize: 23
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      //Get.off(FindAdventure());
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CountryPage()),
                      );*/
                    },
                    // color: Colors.blueGrey[600],
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5)
                    ),
                    child: SizedBox(
                      // width: 120,
                      // width: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*Text(
                            'Open Map',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18
                            ),
                          ),*/
                          Icon(
                            Icons.menu,
                            color: Colors.blueGrey,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 600,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                   shrinkWrap: true,
                   // physics: ClampingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: RaisedButton(
                            padding: EdgeInsets.all(0),
                            onPressed: (){},
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20),),
                                  child: Image.asset(
                                    'assets/images/himeji.jpg',
                                    width: 100,
                                    height: double.infinity,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10,15,10,15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "Himeji Castle",
                                                style: TextStyle(
                                                    fontSize: 20
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 1,),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "Japan",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey[400],
                                                    fontStyle: FontStyle.italic
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        //SizedBox(height: 15,),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.place,
                                                color: Colors.tealAccent[700],
                                                size: 14,
                                              ),
                                              Text(
                                                "Visited",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.tealAccent[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15,)
                      ],
                    );
                  },


                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
