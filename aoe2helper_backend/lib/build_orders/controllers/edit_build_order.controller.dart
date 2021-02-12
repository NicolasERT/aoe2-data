import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:aoe2helper_backend/build_orders/widgets/edit_step.widget.dart';
import 'package:aoe2helper_backend/build_orders/models/models.dart';

import 'edit_step_order.controller.dart';
import 'build_orders.controller.dart';

class EditBuildOrderController extends GetxController {
  final BuildOrdersController _buildOrdersController;

  final newBo = false.obs;

  Rx<BuildOrder> _currentBuildOrder = BuildOrder(
    titleEs: 'Nuevo Build Order',
    titleEn: 'New Build Order',
    steps: [],
  ).obs;

  BuildOrder get currentBuildOrder => _currentBuildOrder.value;
  set currentBuildOrder(BuildOrder bo) => _currentBuildOrder.value = bo;

  StepOrder get currentStepOrder => _buildOrdersController.currentStepOrder;

  int get stepIndex => _buildOrdersController.stepIndex;

  final titleEs = TextEditingController();
  final titleEn = TextEditingController();
  final reference = TextEditingController();

  void setControllers() {
    final currentBuildOrder = _buildOrdersController.currentBuildOrder;
    titleEs.text = currentBuildOrder.titleEs;
    titleEn.text = currentBuildOrder.titleEn;
    reference.text = currentBuildOrder.reference;

    if (_buildOrdersController.index != -1)
      this.currentBuildOrder = _buildOrdersController.currentBuildOrder;
  }

  void openEditStep(int stepIndex) async {
    _buildOrdersController.stepIndex = stepIndex;
    Get.lazyPut<EditStepOrderController>(() => EditStepOrderController(this));
    await Get.bottomSheet(EditStepWidget());
    Get.delete<EditStepOrderController>(force: true);
  }

  void confirmStep(StepOrder step) {
    if (stepIndex != -1) {
      currentBuildOrder.steps[stepIndex] = step;
      _currentBuildOrder.refresh();
    } else {
      currentBuildOrder.steps.add(step);
      _currentBuildOrder.refresh();
    }
    Get.back();
  }

  void removeStep(int index) {
    currentBuildOrder.steps.removeAt(index);
    _currentBuildOrder.refresh();
  }

  EditBuildOrderController(this._buildOrdersController) {
    if (_buildOrdersController.index != -1)
      setControllers();
    else
      newBo.value = true;
  }
}
