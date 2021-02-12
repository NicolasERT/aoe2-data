import 'package:aoe2helper_backend/build_orders/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_build_order.controller.dart';

class EditStepOrderController extends GetxController {
  final EditBuildOrderController _editBuildOrderController;

  final newStep = false.obs;

  final orderEs = TextEditingController();
  final orderEn = TextEditingController();
  final image = TextEditingController();
  final villager = TextEditingController();
  final pop = TextEditingController();
  final totalPop = TextEditingController();
  final wood = TextEditingController();
  final food = TextEditingController();
  final stone = TextEditingController();
  final gold = TextEditingController();

  void setControllers() {
    final currentStepOrder = _editBuildOrderController.currentStepOrder;
    orderEs.text = currentStepOrder.orderEs;
    orderEn.text = currentStepOrder.orderEn;
    image.text = currentStepOrder.image;
    villager.text = currentStepOrder.villager;
    pop.text = currentStepOrder.pop?.toString();
    totalPop.text = currentStepOrder.totalPop?.toString();
    wood.text = currentStepOrder.wood?.toString();
    food.text = currentStepOrder.food?.toString();
    stone.text = currentStepOrder.stone?.toString();
    gold.text = currentStepOrder.gold?.toString();
  }

  void confirmStep() {
    final step = StepOrder(
      orderEs: orderEs.text.trim(),
      orderEn: orderEn.text.trim(),
      image: image.text.trim(),
      villager: villager.text.trim(),
      pop: int.tryParse(pop.text),
      totalPop: int.tryParse(totalPop.text),
      wood: int.tryParse(wood.text),
      food: int.tryParse(food.text),
      stone: int.tryParse(stone.text),
      gold: int.tryParse(gold.text),
    );
    _editBuildOrderController.confirmStep(step);
  }

  void removeStep(int index) {
    _editBuildOrderController.removeStep(index);
  }

  EditStepOrderController(this._editBuildOrderController) {
    if (_editBuildOrderController.stepIndex != -1)
      setControllers();
    else
      newStep.value = true;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
