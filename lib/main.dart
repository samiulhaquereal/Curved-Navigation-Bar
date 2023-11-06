import 'package:curved_navigation/page1.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _page = 0;

  final pages = [Page1(),Page1(),Page1()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text("Curved Navigation"),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          index: 0,
          color: Colors.deepPurpleAccent,
          buttonBackgroundColor: Colors.deepPurpleAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index){
            setState(() {
              _page=index;
            });
          },
          items: [
            Icon(Icons.access_alarm,color: Colors.white,),
            Icon(Icons.ac_unit,color: Colors.white,),
            Icon(Icons.message,color: Colors.white,),
          ],
        ),
        body: pages[_page],
      ),
    );
  }
}

