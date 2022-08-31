import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/cart/controller/cart_controller.dart';
import 'package:sotintas/app/cart/models/cart_model.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/themes/app_font_style.dart';
import 'package:sotintas/app/core/utils/widgets/custom_button.dart';
import 'package:sotintas/app/core/utils/widgets/cart_dropdownbutton.dart';

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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        titleTextStyle: AppFontStyle.appbarTitle,
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          'Carrinho',
        ),
      ),
      body: Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final CartModel item = _controller.cartList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          width: 1,
                          color: AppColors.lightGrey40,
                        ),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7)),
                          child: Image.network(
                            item.paint.coverImage,
                            width: 70,
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Text(item.paint.name,
                                  style: AppFontStyle.cardTitle),
                            ),
                            Divider(
                              height: 12,
                              color: AppColors.lightGrey,
                            ),
                          ],
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(top: 0, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CartDropdownButton(
                                dropdownValue: item.quantity,
                                id: item.id,
                              ),
                              Text(
                                'R\$ ${item.paint.price}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.lightBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _controller.cartList.length,
                ),
              ),
              Positioned(
                top: 20,
                child: Observer(builder: (context) {
                  return _controller.isLoading
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            backgroundColor: AppColors.brightGray,
                            color: AppColors.primary,
                          ),
                        )
                      : Container();
                }),
              ),
              CustomButton(
                height: 60,
                width: double.maxFinite,
                title: 'Confirmar compra',
                textStyle:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                onPressed: () {},
              ),
            ],
          ),
        );
      }),
    );
  }
}
