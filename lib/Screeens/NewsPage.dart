import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_task_app/Model/News.dart';
import 'package:new_task_app/Screeens/HomePage.dart';
import 'package:new_task_app/providers/NewsProvider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}


class _NewsPageState extends State<NewsPage>  with TickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    _tabController=TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      // _panelController.hide();
    });


  }
  @override
  Widget build(BuildContext context) {
    return
        Consumer<NewsProvider>(
          builder: (_,news,__){
            return Column(
              children: [

                Stack(
                  children: [
                    Image(image: AssetImage("assets/img.png"),fit: BoxFit.fill,height: 275,width: double.maxFinite,),


                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromARGB(227, 26, 26, 26),

                                Color.fromARGB(26, 17, 17, 17),

                                Color.fromARGB(0, 11, 11, 11),


                                Color.fromARGB(0, 0, 0, 0)
                              ]
                            )
                          ),
                          height: 275,
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 325,
                                  child: Text(news.currNews!.title,style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ImageIcon(AssetImage("assets/filter.png"),size: 30,color: Colors.white,)
                            ],
                          )
                        )
                  ],
                ),
                Container(
                  height: 73,

                  decoration: BoxDecoration(gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [

                        Color.fromARGB(255, 46, 32, 219),
                        Color.fromARGB(255, 228, 50, 193),
                      ]
                  ),borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(15, 7))),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("CHANCE",style: TextStyle(color:Colors.white),),
                          Text("11%",style: GoogleFonts.montserratAlternates(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.arrow_upward_outlined),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("24H",style: TextStyle(color:Colors.white),),
                                Text("+25495\$",style: TextStyle(color:Colors.white),)
                              ],
                            ),
                          )

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\$09",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ElevatedButton(onPressed: (){}, child: Text("Yes",style: TextStyle(fontSize: 18),),style: ElevatedButton.styleFrom(primary: Colors.green,padding: EdgeInsets.fromLTRB(5, 2, 5, 2),minimumSize: Size.zero,),)
                        ],
                      ),
                      Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\$89",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ElevatedButton(onPressed: (){}, child: Text("No",style: TextStyle(fontSize: 18),),style: ElevatedButton.styleFrom(primary: Colors.purpleAccent,padding: EdgeInsets.fromLTRB(10, 2, 10, 2),minimumSize: Size.zero),)
                        ],
                      ),

                    ],



                  ),

                ),
                TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.pink,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.zero,
                    indicatorColor: Colors.pink,
                    indicatorPadding: EdgeInsets.zero,
                    controller: _tabController,
                    onTap: (x){
                      print(x);
                      if(x==2){
                        news.RelatedPage();

                      }else{
                        news.NotRelatedPage();
                      }

                    },

                    tabs: [
                      Tab(child: Text("Research & News"),),
                      Tab(child: Text("Reactions"),),
                      Tab(child: Text("Related"),),

                    ]),

                SizedBox(
                  height: 220,
                  child: TabBarView(


                      controller: _tabController,
                      children: [
                        ResearchPage(),
                        Reactions(comments: news.currNews?.comments??[],),
                        RelatedPage(related: news.news)
                      ]),
                )

              ],
            );
          },


    );
  }
}


class Reactions extends StatefulWidget {
  Reactions({required this.comments,Key? key}) : super(key: key);
  List<Map> comments;

  @override
  State<Reactions> createState() => _ReactionsState();
}

class _ReactionsState extends State<Reactions> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // _panelController.open();
        HomePage.panelController.open();
      },
      child: Column(
        children: [
          Container(

            padding: EdgeInsets.all(5),
            margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Row(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.assignment_ind_outlined,color: Colors.grey,),
                Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                    child: Text("215",style: TextStyle(color: Colors.grey,fontSize: 18),)),
                Icon(Icons.messenger_outline,color: Colors.grey,),
                Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                    child: Text("95K",style: TextStyle(color: Colors.grey,fontSize: 18),))
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,

                itemCount: max(2,widget.comments.length),
                itemBuilder: (context,key)=>ListTile(

                  leading: ClipOval(
                      child: Image(image: AssetImage("assets/img.png",),width:35 ,height: 35,fit: BoxFit.fill,)),
                  title: RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                    text: TextSpan(
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),

                      children: [
                        TextSpan(text: widget.comments[key]["name"]+" ",style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: widget.comments[key]["comment"],style: TextStyle(fontSize: 13)),

                      ]
                    ),
                  ) ,

                )
              )),
          ListTile( title: Text("Add Comment... ",style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,),trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Text("😍 😭"),
                IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline,size: 15,),)
              ],
            ),
          ),)


        ],
      ),
    );
  }
}


class ResearchPage extends StatelessWidget {
  const ResearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (_,news,__)=>Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${news.currNews?.experts??0} Expert Opinion",style: TextStyle(fontSize: 19,color: Colors.blueGrey),),
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(color: Color.fromARGB(
                        26, 201, 48, 197),borderRadius: BorderRadius.circular(100)),

                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(color: Color.fromARGB(
                        38, 201, 48, 197),borderRadius: BorderRadius.circular(100)),

                  ),
                  Text("${news.currNews?.buyYes??0} %",style: TextStyle(color: Color.fromARGB(255, 228, 50, 193)),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearPercentIndicator(
                    width: 170,
                    animation: true,
                    lineHeight: 7.0,
                    animationDuration: 2000,
                    percent: (news.currNews?.buyYes??0)*1.0/100,
                    barRadius: Radius.circular(5),
                    progressColor: Color.fromARGB(255, 228, 50, 193),
                    trailing: Text("${news.currNews?.buyYes??0}% Buy Yes",style: TextStyle(color: Color.fromARGB(255, 228, 50, 193))),
                  ),

                  LinearPercentIndicator(
                    width: 170,
                    animation: true,
                    lineHeight: 7.0,
                    animationDuration: 2000,
                    percent: (news.currNews?.buyNo??00)*1.0/100,
                    barRadius: Radius.circular(5),
                    progressColor: Color.fromARGB(255, 104, 118, 132),
                    trailing: Text("${news.currNews?.buyNo??0}% Buy No",style: TextStyle(color: Color.fromARGB(
                        255, 104, 118, 132))),
                  ),

                  LinearPercentIndicator(
                    width: 170,
                    animation: true,
                    lineHeight: 7.0,
                    animationDuration: 2000,
                    percent: (100-(news.currNews?.buyNo??0)-(news.currNews?.buyYes??0))*1.0/100,
                    barRadius: Radius.circular(5),
                    progressColor: Color.fromARGB(255, 104, 118, 132),
                    trailing: Text("${100-(news.currNews?.buyNo??0)-(news.currNews?.buyYes??0)}% No Resolve",style: TextStyle(color: Color.fromARGB(
                        255, 104, 118, 132))),
                  ),
                  ],
              )
            ],

          ),
          Expanded(
            child: ListView.builder(
                itemCount: Provider.of<NewsProvider>(context).currNews?.updates.length??0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,key)=>Container(
                  width: 250,
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(news.currNews?.updates[key]["title"]??"",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                            Text(news.currNews?.updates[key]["date"]??"",style: TextStyle(fontSize: 12,color: Colors.grey),),

                          ],
                        ),
                          subtitle: Text(news.currNews?.updates[key]["content"]??"",maxLines: 4,style: TextStyle(fontSize: 12),),

                        )
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),

    ));
  }
}


class RelatedPage extends StatelessWidget {
  List<News> related;
  RelatedPage({Key? key,required this.related}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        HomePage.panelController.open();
      },
      child: ListView.builder(
          itemCount: min(2,related.length),
          itemBuilder: (context,key)=>Container(

            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25)
            ),
            child: Card(
              child: ListTile(
                contentPadding: EdgeInsets.zero,

                tileColor: Colors.white30,
        leading: Image(image: AssetImage(related[key].icon),height: 150,),
                title: Text(related[key].title,style: TextStyle(fontSize: 18),),

      ),
            ),
          )),
    );
  }
}




