import 'package:aoe2helper_backend/build_orders/controllers/edit_build_order.controller.dart';
import 'package:aoe2helper_backend/build_orders/widgets/step.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildOrderPage extends GetView<EditBuildOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final bo = controller.currentBuildOrder;
          return ListTile(
            title: Text(
              controller.newBo.value ? 'Nuevo Build Order' : bo.titleEs,
            ),
            subtitle: controller.newBo.value ? null : Text(bo.titleEn),
          );
        }),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 12),
          children: [
            TextFormField(
              controller: controller.titleEs,
              decoration: InputDecoration(
                labelText: 'Título en español',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: controller.titleEn,
              decoration: InputDecoration(
                labelText: 'Título en ingles',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: controller.reference,
              decoration: InputDecoration(
                labelText: 'Referencia',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              title: Text('Steps'),
              contentPadding: EdgeInsets.zero,
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  controller.openEditStep(-1);
                },
              ),
            ),
            Divider(),
            Obx(() {
              final bo = controller.currentBuildOrder;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List<Widget>.generate(
                  bo.steps.length,
                  (index) => StepWidget(step: bo.steps[index], index: index),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
