import 'package:flutter/material.dart';
// import 'package:date_picker.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Infeq - Test Your Infection'
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: MyHomeBody(),
      // drawer: NavigationDrawer(),
    );
  }
}



// ----------------------------------this is splashScreen-----------------------------------------------------------------------------


class MyHomeBody extends StatefulWidget {
  @override
  _MyHomeBodyState createState() => _MyHomeBodyState();
}

class _MyHomeBodyState extends State<MyHomeBody> {
 
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[

        RaisedButton(
          // height: 0,
          padding: EdgeInsets.all(0),
          onPressed: (){
            Navigator.pushReplacementNamed(context,'/skin_infections');
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqscOgUk73unSyXtmGHqWxual4IydlfdzIIA&usqp=CAU'),
                fit: BoxFit.cover,
              ),
            ),
            height: 200,
            child: Row(
            children: <Widget>[
              SizedBox(
                width: 18.0,
                child: new IconButton(
                    padding: new EdgeInsets.all(10.0),
                    icon: new Icon(Icons.clean_hands, size: 50.0),
                    onPressed: (){},
                )
                    ),
              SizedBox(width: 70),
              Text(
                'Skin Infections \n Detector',
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.yellowAccent,
                ),
              ),
            ]
           ),
          ),
        ),
      ]
    );
  }
}





// @Override
// protected String getModelPath() {
//   return "converted_tflite_quantized/model.tflite";
// }

// @Override
// protected String getLabelPath() {
//   return "converted_tflite_quantized/labels.txt";
// }
