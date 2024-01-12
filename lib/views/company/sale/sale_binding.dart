import 'package:get/get.dart';
import 'package:noobz/views/company/sale/sale_controller.dart';

class SaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaleController());
  }
}