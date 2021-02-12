import 'package:aoe2helper_backend/build_orders/controllers/build_orders.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildOrdersPage extends GetView<BuildOrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aoe 2 Helper Backend'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.bos.length,
          itemBuilder: (context, i) {
            final bo = controller.bos[i];
            return ListTile(
              title: Text(bo.titleEs),
              subtitle: Text(bo.titleEn),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                controller.openEditOrder(i);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.openEditOrder(-1);
        },
      ),
    );
  }
}
