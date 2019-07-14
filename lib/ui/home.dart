import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weightController=new TextEditingController();

  int radioValue=0;
  double _finalResult= 0.0;
String _formattedText="";
  void handleRadio(int value){
    setState(() {
      radioValue=value;

      switch(radioValue)
      {
        case 0:
          _finalResult=calculateWeight(_weightController.text, 0.06);
          _formattedText = "your weight on pluto is ${_finalResult.toStringAsFixed(1)}";// this will make sure that after decimla only single value is there
          break;
        case 1:
          _finalResult=calculateWeight(_weightController.text, 0.38);
          _formattedText = "your weight on neptune is ${_finalResult.toStringAsFixed(1)}";// this will make sure that after decimla only single value is there
          break;
        case 2:
          _finalResult=calculateWeight(_weightController.text, 0.91);
          _formattedText = "your weight on mars is ${_finalResult.toStringAsFixed(1)}";//this is nused to ffixed the float decimal values to one point after decimalo point
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("planet weight"),
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.centerLeft,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png',
            height: 133.0,
          width: 200.0),
          new Container(
            margin: EdgeInsets.all(3.0),
            alignment: Alignment.center,
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "your weight on earth",
                    hintText: "in pounds",
                    icon: Icon(Icons.person_outline),
                  ),
                ),
                Padding(padding:EdgeInsets.all(12.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //radio buttons
                    new Radio<int>(
                      activeColor: Colors.orangeAccent,
                        value: 0, groupValue: radioValue, onChanged: handleRadio),
                    new Text("pluto",style: new TextStyle(color: Colors.white)),
                    new Radio<int>(
                      activeColor: Colors.brown,
                        value: 1, groupValue: radioValue, onChanged: handleRadio),
                    new Text("neptune",style: new TextStyle(color: Colors.white)),

                    new Radio<int>(
                      activeColor: Colors.blue,
                        value: 2, groupValue: radioValue, onChanged: handleRadio),
                    new Text("mars", style: new TextStyle(color: Colors.white)),

                  ],
                ),
                new Padding(padding: EdgeInsets.all(5.6)),
                //results text
                new Text(
                    _weightController.text.isEmpty?"please enter weight" :_formattedText+"lbs",
                    style: TextStyle(color: Colors.white, fontSize: 15.4, fontWeight: FontWeight.w500)),
              ],
            )
          )

          ],
    )
       )
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty&& int.parse(weight)>0)// i have a change here direct pasas weight here without changing in int
      {
        return int.parse(weight)*multiplier;
      }
    else
      {
        print("wrong!!");
        return int.parse("180")*0.38;
      }
  }
}
