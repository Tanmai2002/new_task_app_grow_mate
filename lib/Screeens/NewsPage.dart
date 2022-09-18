import 'package:flutter/material.dart';
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
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                child: Image(image: AssetImage("assets/img.png"),fit: BoxFit.fill,height: 275,width: double.maxFinite,),

              ),
              Container(
                height: 80,

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
                          Text("11%",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
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

                  tabs: [
                    Tab(child: Text("Research & News"),),
                    Tab(child: Text("Reactions"),),
                    Tab(child: Text("Related"),),

                  ]),

              SizedBox(
                height: 200,
                child: TabBarView(

                    controller: _tabController,
                    children: [
                      Text("Research"),
                      Reactions(),
                      Text("Related")
                    ]),
              )

            ],
          ),
        ),

      ],

    );
  }
}


class Reactions extends StatefulWidget {
  const Reactions({Key? key}) : super(key: key);

  @override
  State<Reactions> createState() => _ReactionsState();
}

class _ReactionsState extends State<Reactions> {

  List<Map> comments=[
    {
      "name":"Prof.alison",
      "comment":"""If China does indeed attack Taiwan soon, October is the likely time since the Taiwan Strait waters will be
calm, facilitating amphibious operations.
The drills around Taiwan allowed China to build up
forces in Fujian, which is part of what's needed
before an invasion.
      """,
      "icon":""

    }

    ,

    {
      "name":"Prof.alison",
      "comment":"""If China does indeed attack Taiwan soon, October is the likely time since the Taiwan Strait waters will be calm, facilitating amphibious operations. The drills around Taiwan allowed China to build up forces in Fujian, which is part of what's needed
before an invasion.
      """,
      "icon":""

    }
  ];
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

                itemCount: 2,
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
                        TextSpan(text: comments[key]["name"]+" ",style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: comments[key]["comment"],style: TextStyle(fontSize: 13)),

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


