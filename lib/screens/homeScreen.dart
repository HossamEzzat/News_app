import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/Services/Api.dart';
import 'package:news_app/Services/func.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/widgets/Categorisbuttom.dart';


class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {





  @override
  Widget build(BuildContext context) {
    Api api=Api();
    return Scaffold(
      backgroundColor: backGround,
      body: Column(
        children: [
          //title text
          SafeArea(
            child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 15),
              child: Text(
                "Choose New Categoris",
                style: TextStyle(
                  fontSize: fontbigger,
                  color: textColor,
                ),
              ),
            ),
          ),
          //list cate h
          Container(
              height: 60,
              padding: EdgeInsets.all(3),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Categorisbuttom(
                    Categoris: "general",
                    ColorButton: blue,
                    txtCategoris: "General",
                  ),
                  Categorisbuttom(
                    Categoris: "science",
                    ColorButton: yellow,
                    txtCategoris: "Science",
                  ),
                  Categorisbuttom(
                    Categoris: "health",
                    ColorButton: red,
                    txtCategoris: "Health",
                  ),
                  Categorisbuttom(
                    Categoris: "business",
                    ColorButton: green,
                    txtCategoris: "Business",
                  ),
                  Categorisbuttom(
                    Categoris: "sport",
                    ColorButton: orangeDark,
                    txtCategoris: "Sports",
                  ),
                  Categorisbuttom(
                    Categoris: "entertainment",
                    ColorButton: blue,
                    txtCategoris: "Entertainment",
                  ),
                  Categorisbuttom(
                    Categoris: "technology",
                    ColorButton: orangeLiight,
                    txtCategoris: "Technology",
                  ),
                ],
              )),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 15),
            child: Text(
              "General News",
              style: TextStyle(
                fontSize: fonttlarge,
                color: textColor,
              ),
            ),
          ),
          Expanded(child:
          Container(
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
              future: api.fetchArticles(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: yellow,
                    ),
                  );
                } else {
                   return ListView.builder(
                       itemCount: snapshot.data.length,
                       itemBuilder:(context,i){
                         return GestureDetector(
                           onTap: (){
                             Func.openLink("${snapshot.data[i].url}");
                           },
                           child: Card(
                             color: Colors.grey,
                             child: Container(
                               child: Row(
                                 children: [
                                   Expanded(
                                     flex: 80,
                                     child: Container(
                                       color: Colors.white,
                                       child: Column(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.all(7.0),
                                             child: Image.network((snapshot.data[i].urlToImage==null)?"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVTmNo8onJZ_KBIyh0znfAlzenQS7oynyoNg&usqp=CAU":snapshot.data[i].urlToImage
                                     ,fit: BoxFit.fitWidth,)
                                             ,
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text("${snapshot.data[i].title}",style: TextStyle(
                                               fontSize: 16,fontWeight: FontWeight.w800,fontStyle:FontStyle.italic,
                                             ),
                                               textAlign:TextAlign.center ,),
                                           ),


                                         ],
                                       ),
                                     ),
                                   ),
                                   Container(
                                     child: Column(
                                       children: [
                                         Container(
                                           padding: EdgeInsets.symmetric(vertical: 35),
                                           child: IconButton(onPressed: (){
                                             Func.shareLink("${snapshot.data[i].url}");
                                           }, icon: Icon(Icons.share)),
                                         ),
                                         Container(
                                           padding: EdgeInsets.symmetric(vertical: 35),
                                           child: IconButton(onPressed: (){
                                             Func.copyLink("${snapshot.data[i].url}");
                                             final snackBar=SnackBar(content: Text("copy to clipbord",));
                                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                           }, icon: Icon(Icons.copy)),
                                         )

                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                           ),


                         );
                       });
                }
              }),
          ))
        ],
      ),
    );
  }
}
