import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_mert_album/core/consts/end_points.dart';
import 'package:real_mert_album/core/consts/local_storage.dart';
import 'package:real_mert_album/core/init/network_service.dart';
import 'package:real_mert_album/core/init/setup_locator.dart';
import 'package:real_mert_album/data/model/order_model.dart';

class OrderController extends GetxController{

  final networkService = Locator.getIt<NetworkService>();

  final _orders = <OrderModel>[].obs;
  List<OrderModel> get orders => _orders;
  set orders(List<OrderModel> orders) => _orders.value = orders;

  Future getOrders()async{
    try{
      var response = await networkService.get(endPoint: EndPoints.getOrders);
      if(response is List){
        orders = List<OrderModel>.from(response.map((e) => OrderModel.fromJson(e)));
      }
    } on Exception catch (error) {
      Get.snackbar(
          error.toString().split('|')[0], error.toString().split('|')[1]);
    } catch (error) {
      log('getOrders error $error');
    }
  }

  Future getOrdersMore(page)async{
    try{
      var response = await networkService.get(endPoint: EndPoints.getOrders+'?page=$page');
      if(response is List){
        orders.addAll(List<OrderModel>.from(response.map((e) => OrderModel.fromJson(e))));
      }
    } on Exception catch (error) {
      Get.snackbar(
          error.toString().split('|')[0], error.toString().split('|')[1]);
    } catch (error) {
      log('getOrders error $error');
    }
  }

  Future getOrderDetail(id)async{
    try{
      var response = await networkService.get(endPoint: EndPoints.getOrdersWithId(id));
      if(response is List){
        orders = List<OrderModel>.from(response.map((e) => OrderModel.fromJson(e)));
      }
    } on Exception catch (error) {
      Get.snackbar(
          error.toString().split('|')[0], error.toString().split('|')[1]);
    } catch (error) {
      log('getOrders error $error');
    }
  }

}