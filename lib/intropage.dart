import 'package:flutter/material.dart';
import 'package:travel_bucket_list/homeapp.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/intropic.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height:70,),
                  Text(
                    'ADVENTURE\nPLANNER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height:MediaQuery.of(context).size.height*0.5,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          // width: MediaQuery.of(context).size.width,
                          width: 200,
                          height: 60,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  )
                                ]
                            ),
                            child: RaisedButton(
                              onPressed: (){
                                //Get.off(FindAdventure());
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomeApp()),
                                );
                              },
                              // color: Colors.blueGrey[600],
                              color: Colors.white,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20)
                              ),
                              child: Text(
                                'Get Started',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18
                                ),
                              ),
                            ),
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
    );
  }
}