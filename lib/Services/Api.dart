
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/Article.dart';


class Api{
final String apikey="a911d9da56f641b0a55d3535912825f5";

   Future<List<Article>> fetchArticles() async {
   var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apikey');
   List<Article>ArticleList=[];
    var response= await http.get(url);
    if(response.statusCode==200){
      var responsebody=jsonDecode(response.body)["articles"];
      print(responsebody);
      for(var u in responsebody){
        Article x= Article(u["title"],u["description"] ,u["url"] ,u["urlToImage"] );
        ArticleList.add(x);
      }
      print("list add----->$ArticleList");
      return ArticleList;
    }
    return ArticleList;
  }
   Future<List<Article>> fetchArticlesbyCategoris(String cat) async {
   var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=$cat&apiKey=$apikey');
   List<Article>ArticleList=[];
    var response= await http.get(url);
    if(response.statusCode==200){
      var responsebody=jsonDecode(response.body)["articles"];
      print(responsebody);
      for(var u in responsebody){
        Article x= Article(u["title"],u["description"] ,u["url"] ,u["urlToImage"] );
        ArticleList.add(x);
      }
      print("list add----->$ArticleList");
      return ArticleList;
    }
    return ArticleList;
  }




}