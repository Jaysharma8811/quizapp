import 'package:get/get.dart';

import '../Data/sharedPrefernce/sharedpreference.dart';

class HomeState extends GetxController{
  RxString number="".obs;
  RxString search="".obs;
  RxString url="".obs;

  setSearch(String val){
    search.value=val;
  }

  getUrl() async {
    url.value= await SharedPref.getUrl();
  }
  getNumber() async {
    String number=await SharedPref.getNumber();
    return number;
  }
}