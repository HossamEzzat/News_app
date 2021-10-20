import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/Services/func.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/screens/CategoryScreen.dart';
import 'package:news_app/widgets/Categorisbuttom.dart';


class Categorisbuttom extends StatelessWidget {

String? txtCategoris;
String? Categoris;
Color? ColorButton;


Categorisbuttom({this.txtCategoris, this.Categoris, this.ColorButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RaisedButton(
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen("$Categoris")));
            print("$Categoris");
          },
        child: Text("$txtCategoris",
        style: TextStyle(
          color: Colors.white,
        ),),
        color: ColorButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }
}
