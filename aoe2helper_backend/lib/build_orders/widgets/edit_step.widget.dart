import 'package:aoe2helper_backend/build_orders/controllers/edit_step_order.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditStepWidget extends GetView<EditStepOrderController> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      builder: (_) {
        return Column(
          children: [
            ListTile(
              title: Text(
                controller.newStep.value ? 'Crear Step' : 'Editar Step',
              ),
              tileColor: Colors.black.withOpacity(.3),
              trailing: IconButton(
                icon: Icon(Icons.check),
                splashRadius: 24,
                onPressed: () {
                  controller.confirmStep();
                },
              ),
            ),
            Expanded(
              child: ListView(
                padding:
                    EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 16),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.orderEs,
                          decoration: InputDecoration(
                            labelText: 'Orden en español',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.translate),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.orderEn,
                          decoration: InputDecoration(
                            labelText: 'Orden en inglés',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      // TODO: Hacer un select con las imágenes para hacerlo más cómodo
                      if (controller.image.text.trim() != '') ...[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                controller.image.text,
                              ),
                            ),
                          ),
                          height: 55,
                          width: 55,
                        ),
                        SizedBox(width: 16)
                      ],
                      Expanded(
                        child: TextFormField(
                          controller: controller.image,
                          decoration: InputDecoration(
                            labelText: 'Imágen',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.villager,
                          decoration: InputDecoration(
                            labelText: 'Nº Aldeano',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: controller.pop,
                          decoration: InputDecoration(
                            labelText: 'Población',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: controller.totalPop,
                          decoration: InputDecoration(
                            labelText: 'Población total',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.food,
                          decoration: InputDecoration(
                            labelText: 'Comida',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: controller.wood,
                          decoration: InputDecoration(
                            labelText: 'Madera',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: controller.gold,
                          decoration: InputDecoration(
                            labelText: 'Oro',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: controller.stone,
                          decoration: InputDecoration(
                            labelText: 'Piedra',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
      onClosing: () {},
    );
  }
}
