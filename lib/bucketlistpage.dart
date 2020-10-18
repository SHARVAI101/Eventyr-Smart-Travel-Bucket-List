import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_bucket_list/countrypage.dart';

class BucketListPage extends StatefulWidget {
  @override
  _BucketListPageState createState() => _BucketListPageState();
}

class _BucketListPageState extends State<BucketListPage> {
  List<String> countries = ["India","Japan","Switzerland","USA","Solvenia"];
  List<String> country_images = ["India.jpg","Japan.jpg","Slovenia.jpg","Switzerland.jpg","USA.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'BUCKET LIST',
          style: GoogleFonts.nunito(
            fontSize: 30,
            color: Colors.tealAccent[700],
          ),
        ),
        //centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Container(
            height: 578,
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
                            image: AssetImage("assets/images/" +country_images[index]),
                            fit: BoxFit.fitWidth,
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
