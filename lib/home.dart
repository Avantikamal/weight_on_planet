import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new homeState();
  }

}

class homeState extends State<home> {
final TextEditingController wtContlr= new TextEditingController();
  int radioValue = 0;
  double result =0.0,mul;

  String formatedText="";
  void handle(int value){
    setState((){
      radioValue = value;
    switch(radioValue){
      case 0: result=calwt(wtContlr.text,0.06);
      formatedText="your wt on pluto is ${result.toStringAsFixed(1)}";
      break;
      case 1: result=calwt(wtContlr.text, mul);
      formatedText="your wt on mars is ${result.toStringAsFixed(1)}";

      break;
      case 2 : result=calwt(wtContlr.text, 0.91);
      formatedText="your wt on venus is ${result.toStringAsFixed(1)}";
        
    }
    }

    );

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("weight on planet x"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
            padding: const EdgeInsets.all(2.50),
            children: <Widget>[
              new Image.asset('images/img.png',
                height: 133.0,
                width: 200.0,),
              new Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: wtContlr,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'your weight on earth',
                          hintText: 'in pounds',
                          icon: new Icon(Icons.person_outline)
                      ),
                    ),
                    new Padding(padding: new EdgeInsets.all(5.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio<int>(
                          activeColor: Colors.brown,
                            value: 0, groupValue: radioValue , onChanged: handle),
                        new Text(
                          "pluto",
                          style: new TextStyle(
                            color: Colors.white),
                          ),

                        new Radio<int>(
                          activeColor: Colors.red,
                            value: 1, groupValue: radioValue , onChanged: handle),
                        new Text(
                          "mars",
                          style: new TextStyle(
                              color: Colors.white),
                        ),
                        new Radio<int>(
                          activeColor: Colors.orangeAccent,
                            value: 2, groupValue: radioValue , onChanged: handle),
                        new Text(
                          "venus",
                          style: new TextStyle(
                              color: Colors.white),
                        ),
                      ],
                    ),
                    new Padding(padding: new EdgeInsets.all(15.6)),

                    new Text(
                      wtContlr.text.isEmpty ? "please enter weight" : formatedText+"lbs",
                      //"$formatedText lbs",
                      style: new TextStyle(
                        color: Colors.white,fontSize: 19.4,
                        fontWeight: FontWeight.w500
                      )
                ,),

                  ],
                )
              )
            ],
        )
      ),
    );
  }

  double calwt(String wt,double mul) {
    if(int.parse(wt).toString().isNotEmpty && int.parse(wt)>0){
      return int.parse(wt)* mul ;
    }
    else{
      print("wrong");
      return int.parse("180")*0.38;
    }
  }
}