import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:real_mert_album/core/init/local_service.dart';
import 'package:real_mert_album/core/init/setup_locator.dart';
import 'package:real_mert_album/data/controller/order_controller.dart';
import 'package:real_mert_album/data/controller/user_controller.dart';
import 'package:real_mert_album/data/model/order_model.dart';


class HomePageController extends GetxController{
  final scrollController = ScrollController();
  RxInt page = 1.obs;

  void scrollListener() async {
    // sayfa en aşağıda mı?
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        print('en aşağıda');
        page.value++;
        //Get.find<OrderController>().getOrdersMore(page);
      }

  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
  }
}

class HomePage extends GetWidget<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<OrderController>(
        init: OrderController(),
        initState: (func){
          func.controller?.getOrders();
        },
        builder: (controller2) => controller2.orders.isNotEmpty == true ? ListView.builder(
          controller: controller.scrollController,
          itemCount: 200,
          itemBuilder: (context, index) {
            return Text(
              controller2.orders[0].name ?? '',
            );
          },
        ) : Container(),
      ),
    );
  }
}
