import 'package:flutter/material.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 7,),
                  Container(
                    width: 260,
                    //margin: EdgeInsets.fromLTRB(12.0,48.0,20.0,0.0),
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
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 350,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      title: Text('New York'),
                      subtitle: Text('A strong shit'),
                    ),
                    ListTile(
                      title: Text('Japan'),
                      subtitle: Text('A strong shit'),
                    ),
                    ListTile(
                      title: Text('Las Vegas'),
                      subtitle: Text('A strong shit'),
                    ),
                    ListTile(
                      title: Text('India'),
                      subtitle: Text('A strong shit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }
}
