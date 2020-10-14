import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/destination_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top:0),
        child: Column(
          children: <Widget>[
            Container(
              height: 320.0,
              width: 500.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Colors.cyan,
                color: Colors.tealAccent[700],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 100),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Find an Adventure,        with us!',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40,),

                    Container(
                      height: 45,
                      margin: const EdgeInsets.only(right: 40, left: 20),
                      child: TextField(
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
                              color: Colors.tealAccent[700],
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 25,), //30
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Trending Places',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 10), //20
            SizedBox(
              height: 268,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  itemBuilder: (BuildContext context, int index) {
                    Destination destination = destinations[index];
                    //scrollDirection: Axis.horizontal,

                    return Container(
                      padding: EdgeInsets.only(left: 15, right: 0),
                      margin: EdgeInsets.all(10.0),
                      //color: Colors.tealAccent[700],
                      width: 195.0,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Positioned(
                            bottom: 15.0,
                            child: Container(
                              height: 70.0,
                              width: 180.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                    Text(
                                      destination.country,
                                      style: TextStyle(
                                        color: const Color(0xFF8d8c91),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  //color: Colors.white,//5f2ed1
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    height: 180.0,
                                    width: 180.0,
                                    //image: AssetImage(destination.imageUrl),
                                    image: AssetImage(destination.imageUrl),

                                    fit: BoxFit.cover,
                                  ),
                                ),
                                //                        Positioned(
                                //                          left: 10.0,
                                //                          bottom: 10.0,
                                //                          child: Column(
                                //                            crossAxisAlignment: CrossAxisAlignment.center,
                                //                            mainAxisAlignment: MainAxisAlignment.center,
                                //                            children: <Widget>[
                                //                              Text(
                                //                                'Paris',
                                //                                textAlign: TextAlign.center,
                                //                                style: TextStyle(
                                //                                  color: Colors.white,
                                //                                  fontSize: 24.0,
                                //                                  fontWeight: FontWeight.w600,
                                //                                  letterSpacing: 1,
                                //                                ),
                                //                              ),
                                //                              Row(
                                //                                children: <Widget>[
                                ////                                  Icon(
                                ////                                    FontAwesomeIcons.locationArrow,
                                ////                                    size: 10.0,
                                ////                                    color: Colors.white,
                                ////                                  ),
                                //                                  Text(' hie',
                                //                                    style: TextStyle(
                                //                                      color: Colors.white,
                                //                                    ),
                                //                                  ),
                                //                                ],
                                //
                                //                              ),
                                //                            ],),
                                //                        )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
            SizedBox(height: 0),
            RaisedButton(
              child: Text(
                'Open Modal',
              ),
              onPressed: (){
                showDialog(context: context , builder : (context){
                  return Container(
                    height: 250,
                    child: AlertDialog(
                      contentPadding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      title: Column(
                          children:[
                            Image.asset('assets/images/paris.jpg',
                              width: double.infinity, height: 180, fit: BoxFit.cover,),
                            SizedBox(height: 10),
                            Text('Eiffel Tower, Paris'),
                            SizedBox(height: 10),
                          ]
                      ),

                      //content: Text('Add to the Bucket list'),
//                        actions: <Widget>[
//                          ButtonBar(
//                            alignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              RaisedButton(
//                                onPressed: (){},
//                                child: Text(
//                              'Add to Bucket List',
//                                style: TextStyle(
//                                  fontSize: 16,
//                                ),
//                              ),
//                              textColor: Colors.white,
//                              color: Colors.tealAccent[700],
//                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                              ),
//                          ]
//                          ),
////                        FlatButton(
////                          child: Text("Cancel"),
////                          onPressed: () {},
////                        ),
//                        ],
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 20),
                            child: RaisedButton(
                              onPressed: (){},
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      size: 26.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      'Add to Bucket List',
                                      style: TextStyle(
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              textColor: Colors.white,
                              color: Colors.tealAccent[700],
                              padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                            ),
                          ),
                        ],
                      ),

                    ),
                  );
                });
              },
            ),
          ],

        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
              color: Colors.tealAccent[700],
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_travel,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),

    );
  }
}


