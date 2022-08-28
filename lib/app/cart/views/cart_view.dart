import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/cart/controller/cart_controller.dart';
import 'package:sotintas/app/cart/models/cart_model.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final _controller = GetIt.I.get<CartController>();

  @override
  void initState() {
    super.initState();
    _controller.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Observer(builder: (context) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final CartModel item = _controller.cartList[index];
                return ListTile(
                  title: Text(item.paint.name),
                  subtitle: Text(item.quantity.toString()),
                  trailing: Text(item.paint.price),
                );
              },
              itemCount: _controller.cartList.length,
            );
          }),
        ],
      ),
    );
  }
}
