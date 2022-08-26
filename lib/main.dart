import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/cart/controller/cart_controller.dart';
import 'package:sotintas/app/cart/views/cart_view.dart';
import 'package:sotintas/app/core/repository/paint_repository.dart';
import 'package:sotintas/app/shop/controller/shop_controller.dart';
import 'package:sotintas/app/shop/views/shop_view.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<PaintRepository>(PaintRepository(Dio()));
  getIt.registerSingleton<ShopController>(ShopController());
  getIt.registerSingleton<CartController>(CartController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Só Tintas',
      home: ShopView(),
    );
  }
}
