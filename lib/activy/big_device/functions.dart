class Functions {

  static final Functions _functions = Functions._internal();
  factory Functions(){
    return _functions;
  }
  Functions._internal();

  bool isClickStart = false;
  List openedSoftware = [];




  void startMenu(){
    isClickStart = !isClickStart;
  }

void openingAppsBar(app){

}


}