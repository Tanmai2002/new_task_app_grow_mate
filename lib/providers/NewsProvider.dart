import 'package:flutter/material.dart';

import '../Model/News.dart';

class NewsProvider with ChangeNotifier{
  List<News> news=[];
  int _curindex=0;
  News? currNews;
  void changeNews(index){
    _curindex=index;
    currNews=news[_curindex];
    notifyListeners();
  }
  void addnews(News n){
    news.add(n);
  }

}