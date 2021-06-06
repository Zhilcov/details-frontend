import 'package:details_frontend/components/details/filter/filters_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: FiltersWidget(),
                  )
                )

              ],
            ),
            Column(
              children: [

              ],
            )
          ],
        ),
      ),
      drawer: null
    );
  }
}