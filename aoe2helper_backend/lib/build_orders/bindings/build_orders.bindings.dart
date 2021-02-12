import 'package:aoe2helper_backend/build_orders/controllers/build_orders.controller.dart';
import 'package:get/get.dart';

class BuildOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuildOrdersController>(() => BuildOrdersController());
  }
}
