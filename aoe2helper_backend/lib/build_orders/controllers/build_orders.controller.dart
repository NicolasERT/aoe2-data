import 'package:aoe2helper_backend/build_orders/data/build_orders.data.dart';
import 'package:aoe2helper_backend/build_orders/models/models.dart';
import 'package:get/get.dart';

import 'edit_build_order.controller.dart';

class BuildOrdersController extends GetxController {
  final bos = List<BuildOrder>.generate(
    buildOrders.length,
    (i) => BuildOrder.fromMap(buildOrders[i]),
  ).obs;

  final _index = 0.obs;
  set index(int i) => _index.value = i;
  int get index => _index.value;

  final _stepIndex = 0.obs;
  set stepIndex(int i) => _stepIndex.value = i;
  int get stepIndex => _stepIndex.value;

  BuildOrder get currentBuildOrder => bos[index];
  StepOrder get currentStepOrder => currentBuildOrder.steps[stepIndex];

  void openEditOrder(int index) async {
    this.index = index;
    Get.lazyPut<EditBuildOrderController>(() => EditBuildOrderController(this));
    await Get.toNamed('/build_order');
    Get.delete<EditBuildOrderController>(force: true);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
