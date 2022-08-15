import 'dart:math';

import 'package:flutter/material.dart';


import 'resizableWindow.dart';

class MdiController{


  MdiController(this._onUpdate, this.context);

  var context;

  List<ResizableWindow> _windows = List.empty(growable: true);

  VoidCallback _onUpdate;


  List<ResizableWindow> get windows => _windows;




  void addApp(title,app){

    _createNewWindowedApp(title,app);

  }
  void _createNewWindowedApp(String title,Widget app,){


    ResizableWindow resizableWindow = ResizableWindow(title,app);


    //Set initial position
    resizableWindow.x =  MediaQuery.of(context).size.width *0.3;
    resizableWindow.y =  MediaQuery.of(context).size.height *0.2;

    //Init onWindowDragged
    resizableWindow.onWindowDragged = (dx,dy){

      resizableWindow.x += dx;
      resizableWindow.y += dy;

      //Put on top of stack
      _windows.remove(resizableWindow);
      _windows.add(resizableWindow);

      _onUpdate();


    };

    //Init onCloseButtonClicked
    resizableWindow.onCloseButtonClicked = (){
      _windows.remove(resizableWindow);
      _onUpdate();
    };


    //Add Window to List
    _windows.add(resizableWindow);

    // Update Widgets after adding the new App
    _onUpdate();

  }


}