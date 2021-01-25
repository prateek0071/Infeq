import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

 class ChooseSkinImage extends StatelessWidget{
   @override 
   Widget build(BuildContext context){
     return Scaffold(
       body: ImageSelectionBody(),
       appBar: AppBar(
         title: Text('skin Infection detector')
       ),
     );
   }
 }


//global variables
  


class ImageSelectionBody extends StatefulWidget { 
  @override
  _ImageSelectionBodyState createState() => _ImageSelectionBodyState();
}

class _ImageSelectionBodyState extends State<ImageSelectionBody> {


  //-------------------------------------output page-------------------------
  Widget OutputPage(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Infeq'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.file(File(pickedImage.path)),
            SizedBox(height:100),
            Text('this disease is $name and we are $confidence % sure')
          ],
        ),
      ),
    );
  }

//------------------------------------------------------------------------------------------------------------
  File pickedImage;
  bool isImageLoaded;
  List results;
  String confidence = "";
  String name = '';
  String numbers ="";


  getImageFromGallery() async{

    // ignore: deprecated_member_use
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = File(tempStore.path);
      isImageLoaded = true;
    });
  }

  loadModel() async{
    var resultant = await Tflite.loadModel(
      model: 'assets/ml_models/model_unquant.tflite',
      labels: 'assets/ml_models/labels.txt',
    );

    print('result after loading model: $resultant');
  }

  applyModelOnImage(File file) async{
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 15,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
      );

      setState(() {
        results = res;
        String str = results[0]["labels"];
        name = str.substring(2);
        confidence = results != null ?(results[0]['confidence']*100.0).toString().substring(0,2) + "s"  +  "";
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView(
          children: <Widget>[
              Expanded(
                child:RaisedButton.icon(
                  padding: EdgeInsets.fromLTRB(10,100,10,100),
                color: Colors.green,
                onPressed: (){},
                icon: Icon(Icons.camera, size: 80,color: Colors.white),
                label: Text(
                  'take from \n camera',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                
              ),
              ),

              Expanded(
                child:RaisedButton.icon(
                  padding: EdgeInsets.fromLTRB(10,100,10,100),
                color: Colors.cyan,
                onPressed: (){},
                icon: Icon(Icons.camera, size: 80, color: Colors.white),
                label: Text(
                  'take from \n camera',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                
              ),
              ),

              ListTile(
                title: Text('Go back to HomeScreen', ),
                trailing: Icon(Icons.arrow_right),
              ),
          ]
        ),
      ),
    );
  }
}


//--------------------------------------------prediction page---------------------------------------------
