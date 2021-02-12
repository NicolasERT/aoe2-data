import 'package:aoe2helper_backend/build_orders/bindings/build_orders.bindings.dart';
import 'package:aoe2helper_backend/build_orders/pages/build_order.page.dart';
import 'package:aoe2helper_backend/build_orders/pages/build_orders.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aoe2Helper Backend',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => BuildOrdersPage(),
          binding: BuildOrdersBinding(),
        ),
        GetPage(
          name: '/build_order',
          page: () => BuildOrderPage(),
          binding: BuildOrdersBinding(),
        ),
      ],
    );
  }
}
