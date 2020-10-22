import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_bucket_list/countrypage.dart';
import 'package:travel_bucket_list/globalvars.dart';

class BucketListPage extends StatefulWidget {
  @override
  _BucketListPageState createState() => _BucketListPageState();
}

class _BucketListPageState extends State<BucketListPage> {
  List<String> countries = [];
  List<String> country_images = [];

  @override
  void initState() {
    super.initState();

    for(int i = 0; i < GlobalVariables.bucketlist.length ; i++)
    {
      countries.add(GlobalVariables.bucketlist[i][1]);
      country_images.add(GlobalVariables.bucketlist[i][3]);
    }
    setState(() {
      countries=countries.toSet().toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        elevation: 0,
//        title: Text(
//          'BUCKET LIST',
//          style: GoogleFonts.nunito(
//            fontSize: 30,
//            color: Colors.tealAccent[700],
//            fontWeight: FontWeight.bold,
//          ),
//        ),
//        //centerTitle: true,
//        automaticallyImplyLeading: false,
//        backgroundColor: Colors.transparent,
//      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 45,),
          Text(
            'BUCKET LIST',
            style: GoogleFonts.reemKufi(
              fontSize: 40,
              color: Colors.tealAccent[700],
              //fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Your bucket list organized countrywise',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'BUCKET LIST',
                style: GoogleFonts.reemKufi(
                  fontSize: 40,
                  color: Colors.tealAccent[700],
//                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your bucket list organized countrywise',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
          ),*/
          SizedBox(height: 25,),
          Container(
            height: 520,
            child: AlphabetListScrollView(
              strList: countries,
              highlightTextStyle: TextStyle(
                color: Colors.tealAccent[700],
              ),
              showPreview: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 40.0, 20.0),
                  child: Card(
                    elevation: 15,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CountryPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(country_images[index]),
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                            //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                          ),
                        ),
                        child: new BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 0.0, sigmaY: 00.0),
                          child: new Container(
                            decoration: new BoxDecoration(
                                color: Colors.black.withOpacity(0.25),
                            ),
                            child: Center(
                              child: Text(
                                countries[index],
                                style: GoogleFonts.poppins(
                                  fontSize: 35,
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ),
                    ),

                  ),
                );
              },
              indexedHeight: (i) {
                return 180;
              },
            ),
          ),
        ],
      )
    );
  }
}
