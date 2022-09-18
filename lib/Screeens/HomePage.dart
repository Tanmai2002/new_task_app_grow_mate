import 'dart:ui';

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
    n.buyYes=12;
    n.buyNo=87;
    n.experts=215;
    n.title="Will China invade Taiwan before end september? ";
    n.icon="assets/img.png";
    n.updates=[
      {
        "title":"BBC",
        "content":"Most people the BBC spoke to do not believe China is about to attack Taiwan. \"They're a bunch of gangsters,\" said one man fishing on the...",
        "date":"1 Sept"
      },

      {
        "title":"BBC",
        "content":"Most people the BBC spoke to do not believe China is about to attack Taiwan. \"They're a bunch of gangsters,\" said one man fishing on the...",
        "date":"1 Sept"
      },

      {
        "title":"BBC",
        "content":"Most people the BBC spoke to do not believe China is about to attack Taiwan. \"They're a bunch of gangsters,\" said one man fishing on the...",
        "date":"1 Sept"
      }
    ];
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

    News n1=News(icon:"assets/news1.png",title:"Liz Truss will be UK’s next Prime Minister?");
    News n2=News(icon:"assets/news2.png",title:"British Pound will fall after Prime Minister elections?");
    News n3=News(icon:"assets/news3.png",title:"British Railway Strikes will end by before Sept. 2022?");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NewsProvider>(context,listen: false).addnews(n);
      Provider.of<NewsProvider>(context,listen: false).addnews(n1);
      Provider.of<NewsProvider>(context,listen: false).addnews(n2);
      Provider.of<NewsProvider>(context,listen: false).addnews(n3);

      Provider.of<NewsProvider>(context,listen: false).changeNews(0);

    });
    super.initState();
  }
  BoxDecoration decoration=BoxDecoration(gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.purpleAccent,
        Color.fromARGB(255, 253, 159, 235)
      ]

  ),borderRadius:BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular(25)) );

  @override
  Widget build(BuildContext context) {

    return Consumer<NewsProvider>(
      builder: (_,x,__){
        if(x.currNews==null) {
          return Text("");
        }
       return SlidingUpPanel(
      controller: HomePage.panelController,
      minHeight: 0,
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
                          x.isRelated?"Related":"Reactions",
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
             Divider(color: Colors.grey,),
             x.isRelated?RelatedSlideUpPage(): ReactionPage(comments:x.currNews?.comments??[])





            ],
          ),
        ),
      ),
      collapsed: SizedBox(),
      body: Scaffold(
        body: NewsPage(),
        bottomNavigationBar: BottomNavigationBar(

          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: Color.fromARGB(
              255, 95, 95, 95)),
          selectedItemColor: Colors.purpleAccent,
          items: [
            BottomNavigationBarItem(icon: Container(
                decoration:decoration ,
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: ImageIcon(AssetImage("assets/calculator.png"))), label: "home",),
            BottomNavigationBarItem(icon: Container(
                decoration:BoxDecoration() ,
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: ImageIcon(AssetImage("assets/market.png"),)), label: "growth",),
            BottomNavigationBarItem(icon: Container(
                decoration:BoxDecoration() ,
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: ImageIcon(AssetImage("assets/pie.png"),)), label: "stats",),
            BottomNavigationBarItem(icon: Container(
                decoration:BoxDecoration() ,
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: ImageIcon(AssetImage("assets/person.png"),)), label: "account",),
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


class RelatedSlideUpPage extends StatefulWidget {
  const RelatedSlideUpPage({Key? key}) : super(key: key);

  @override
  State<RelatedSlideUpPage> createState() => _RelatedSlideUpPageState();
}

class _RelatedSlideUpPageState extends State<RelatedSlideUpPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (_,news,__) {
      List<News> related=news.news.where((element) => element.title!=news.currNews!.title).toList();
      return Expanded(

        child: ListView.builder(
            itemCount: related.length,
            itemBuilder: (context, key) =>
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),

                      color: Colors.white24,
                      border: Border.all(color: Colors.black26)
                  ),
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.fromLTRB(7, 5, 7, 5),
                  child: Row(

                    children: [
                      Image(image: AssetImage(related[key].icon),
                        height: 75,
                        width: 75,
                        fit: BoxFit.fill,),
                      Container(

                          padding: EdgeInsets.all(10),
                          width: 275,
                          child: Text(related[key].title,
                            style: TextStyle(fontSize: 18),)),

                    ],
                  ),
                )),
      );

    }
    );
  }
}
