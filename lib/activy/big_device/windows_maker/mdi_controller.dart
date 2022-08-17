

import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/windows_maker/list_widget.dart';


import 'resizable_window.dart';

class MdiController{

  MdiController(this.onUpdate, this.context);

  // ignore: prefer_typing_uninitialized_variables
  var context;


  final List<ResizableWindow> _windows = List.empty(growable: true);

  VoidCallback onUpdate;
  bool isMaximize = false;
  List<ResizableWindow> get windows => _windows;




  void addApp(title,app, {bool initMaximize = false}){
    isMaximize = initMaximize;


    _createNewWindowedApp(title,app);

  }
  void _createNewWindowedApp(String title,Widget app,){


    ResizableWindow resizableWindow = ResizableWindow(title,app,isMaximize,context);


    //Set initial position
    resizableWindow.x = !isMaximize ?  MediaQuery.of(context).size.width *0.3 : 0;
    resizableWindow.y = !isMaximize ? MediaQuery.of(context).size.height *0.2 : 0;

    //Init onWindowDragged
    resizableWindow.onWindowDragged = (dx,dy){

      resizableWindow.x += dx;
      resizableWindow.y += dy;

      //Put on top of stack
      _windows.remove(resizableWindow);
      _windows.add(resizableWindow);


      onUpdate();


    };

    //Init onCloseButtonClicked
    resizableWindow.onCloseButtonClicked = (){
      _windows.remove(resizableWindow);
      ListWidget().windowsOpenned.remove(resizableWindow);
      onUpdate();
    };


    //Add Window to List
    _windows.add(resizableWindow);
    ListWidget().windowsOpenned.add(resizableWindow);


    // Update Widgets after adding the new App
    onUpdate();

  }


}

