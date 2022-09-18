import 'package:flutter/material.dart';
import 'package:new_task_app/Model/News.dart';
import 'package:new_task_app/Screeens/NewsPage.dart';
import 'package:new_task_app/providers/NewsProvider.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timeago/timeago.dart' as timeago;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static PanelController panelController = PanelController();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(12.0),
    topRight: Radius.circular(12.0),
  );
  @override
  void initState() {
    // TODO: implement initState
    News n=News();
    n.comments=[
      {
        "name":"Prof.xyz",
        "comment":"""If China does indeed attack Taiwan soon, October is the likely time since the Taiwan Strait waters will be calm, facilitating amphibious operations. The drills around Taiwan allowed China to build up forces in Fujian, which is part of what's needed before an invasion.""",
        "icon":"",
        "time":DateTime(2022)
      }
      ,
      {
        "name":"Prof.alison",
        "comment":"""If China does indeed attack Taiwan soon, October is the likely time since the Taiwan Strait waters will be calm, facilitating amphibious operations. The drills around Taiwan allowed China to build up forces in Fujian, which is part of what's needed before an invasion.""",
        "icon":"",
        "time":DateTime(2022,2,4)

      }
    ];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NewsProvider>(context,listen: false).addnews(n);
      Provider.of<NewsProvider>(context,listen: false).changeNews(0);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<NewsProvider>(
      builder: (_,x,__){
        if(x.currNews==null) {
          return Text("");
        }
       return SlidingUpPanel(
      controller: HomePage.panelController,
      minHeight: 410,
      maxHeight: 410,
      borderRadius: radius,
      panel: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Drawer(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(25, 10, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Reactions",
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),

                        Row(
                          children: [
                            InkWell(

                                onTap: () {},
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                    child: Text(
                                      "Top",
                                      style: TextStyle(color: Colors.grey),
                                    )),
                                borderRadius: BorderRadius.circular(12)),
                            InkWell(

                                onTap: () {},
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                    child: Text(
                                      "Newest",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                borderRadius: BorderRadius.circular(12)),



                          ],
                        )
                      ],
                    ),
                    IconButton(onPressed: () {
                      HomePage.panelController.close();
                    }, icon: Icon(Icons.close))
                  ],
                ),
              ),
              ReactionPage(comments:x.currNews?.comments??[])





            ],
          ),
        ),
      ),
      collapsed: SizedBox(),
      body: Scaffold(
        body: NewsPage(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "r"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "hii"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "hello"),
          ],
        ),
      ),
    );
      }
    );
  }
}


class ReactionPage extends StatefulWidget {
  List<Map> comments;
  ReactionPage( {required this.comments});

  @override
  State<ReactionPage> createState() => _ReactionPageState();
}

class _ReactionPageState extends State<ReactionPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 248, 248, 248)),
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: RichText(text: TextSpan(
                style: TextStyle(fontSize: 12),
                children: [
              TextSpan(text: "Remember to keep comments respectful and to follow our",style: TextStyle(color: Colors.black)),
              TextSpan(text: " Community Guidelines",style: TextStyle(color: Colors.blue))
            ]),),
          ),
          ExpansionTile(

            leading: ClipOval(

                child: Image(image: AssetImage("assets/img.png"),width: 50,height: 50,fit: BoxFit.fill,)),
            title: Text("Add A Comment...",style: TextStyle(color: Colors.grey),),
            trailing: IconButton(onPressed:(){},icon: Icon(Icons.add_circle_outline,size: 17,color: Colors.grey,),),

          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: widget.comments.length,
                itemBuilder: (context,key)=>Container(
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    
                    leading: ClipOval(

                        child: Image(image: AssetImage("assets/img.png"),width: 30,height: 30,fit: BoxFit.fill,)),
                    title: Text("${widget.comments[key]["name"]}  ${timeago.format(widget.comments[key]["time"])}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.comments[key]["comment"],style: TextStyle(color: Colors.black),),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),

                          width: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              ImageIcon(AssetImage("assets/like.png"),size: 20,),
                              ImageIcon(AssetImage("assets/dislike.png"),size: 20,),
                              ImageIcon(AssetImage("assets/img_1.png"),size: 20,),
                            ],
                          ),
                        ),
                        Text("${widget.comments[key]["replies"]??0} Replies",style: TextStyle(color: Colors.blue),)
                      ],
                    ),



                  ),
                )),
          )

        ],
      ),
    );
  }
}
