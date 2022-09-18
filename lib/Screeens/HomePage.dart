import 'package:flutter/material.dart';
import 'package:new_task_app/Screeens/NewsPage.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
PanelController _panelController=PanelController();
BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        controller: _panelController,
        minHeight: 0,
        maxHeight:350,
        borderRadius: radius,

        panel: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: ListTile(
              title: Text("Reactions"),
              subtitle: SizedBox(child: Row(
                children: [
                  ElevatedButton(onPressed: (){}, child: Text("Top"))
                ],
              ),),
            ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.close,color: Colors.black,))
            ],
          ),
        ),
        collapsed: SizedBox(),

        body:
        Scaffold(
          body:
          NewsPage(),


          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "r"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "hii"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "hello"),

          ],

          ),
        ),
      );

  }
}
