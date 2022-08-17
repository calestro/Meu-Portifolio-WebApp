import 'package:port_leonir/activy/big_device/windows_maker/mdiController.dart';

class Functions {

  static final Functions _functions = Functions._internal();
  factory Functions(){
    return _functions;
  }
  Functions._internal();

  bool isClickStart = false;





  void startMenu(){
    isClickStart = !isClickStart;
  }

void openingAppsBar(app){


}


}