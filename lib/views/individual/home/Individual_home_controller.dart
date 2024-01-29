import 'package:get/get.dart';
import 'package:intl/intl.dart';

class IndividualHomeController extends GetxController {
  static IndividualHomeController instance = Get.find();
  //  String language = 'english';
  
   String formattedDate =DateFormat('MMMM, d, yyyy').format(DateTime.now());


}
