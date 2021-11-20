import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../languages/localizations.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(MyLocalizations.instanceLocalization['app_title']),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  '10:06:34',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
                  Container(
                    alignment: Alignment.center,
                    child: Transform.scale(
                      child: CircularProgressIndicator(),
                      scale: 2,
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 10,)
          ],
        ),
      ),
    );
  }

}