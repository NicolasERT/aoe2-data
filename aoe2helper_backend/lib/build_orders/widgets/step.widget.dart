import 'package:aoe2helper_backend/build_orders/models/models.dart';
import 'package:aoe2helper_backend/build_orders/controllers/edit_build_order.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepWidget extends GetView<EditBuildOrderController> {
  final StepOrder step;
  final int index;

  const StepWidget({Key key, this.step, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: step.villager != null
                  ? Text(
                      '${step.villager}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
            title: Text('${step.orderEs}\n${step.orderEn}'),
            subtitle: Row(
              children: [
                if (step.wood != null) ...[
                  Image.asset(
                    'assets/images/resources/wood.png',
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '${step.wood}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                if (step.food != null) ...[
                  Image.asset(
                    'assets/images/resources/food.png',
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '${step.food}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                if (step.gold != null) ...[
                  Image.asset(
                    'assets/images/resources/gold.png',
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '${step.gold}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                if (step.stone != null) ...[
                  Image.asset(
                    'assets/images/resources/stone.png',
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '${step.stone}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                if (step.pop != null && step.totalPop != null) ...[
                  Image.asset(
                    'assets/images/resources/town_center.png',
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      '${step.pop}/${step.totalPop}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            onTap: () {
              controller.openEditStep(index);
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            controller.removeStep(index);
          },
        ),
      ],
    );
  }
}
