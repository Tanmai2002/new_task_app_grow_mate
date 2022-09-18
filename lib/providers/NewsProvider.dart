import 'package:flutter/material.dart';

import '../Model/News.dart';

class NewsProvider with ChangeNotifier{
  List<News> news=[];
  int _curindex=0;
  bool isRelated=true;
  News? currNews;
  void RelatedPage(){
    isRelated=true;
    notifyListeners();
  }
  void NotRelatedPage(){
    isRelated=false;
    notifyListeners();
  }
  void changeNews(index){
    _curindex=index;
    currNews=news[_curindex];
    notifyListeners();
  }
  void addnews(News n){
    news.add(n);
  }

}