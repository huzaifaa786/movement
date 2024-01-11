import 'package:get/get.dart';
import 'package:noobz/views/company/proofdetail/proof_detail_controller.dart';
import 'package:noobz/views/individual/auth/signup/sigup_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class ProofDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProofDetailController());
  }
}
