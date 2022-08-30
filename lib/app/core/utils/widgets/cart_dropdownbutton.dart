import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/cart/controller/cart_controller.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/themes/app_font_style.dart';

// ignore: must_be_immutable
class CartDropdownButton extends StatefulWidget {
  CartDropdownButton({Key? key, required this.dropdownValue, required this.id})
      : super(key: key);

  int dropdownValue;
  String id;

  @override
  State<CartDropdownButton> createState() => _CartDropdownButtonState();
}

class _CartDropdownButtonState extends State<CartDropdownButton> {
  final _controller = GetIt.I.get<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          width: 1,
          color: Colors.grey.shade400,
        ),
        color: AppColors.backgrundWhite,
      ),
      child: DropdownButton<int>(
          icon: Icon(
            Icons.expand_more,
            color: AppColors.lightGrey,
            size: 16,
          ),
          underline: const SizedBox(),
          alignment: Alignment.bottomCenter,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          value: widget.dropdownValue,
          items: [
            DropdownMenuItem<int>(
              value: 1,
              child: Text(
                '1 un.',
                style: AppFontStyle.dropdownItem,
              ),
            ),
            DropdownMenuItem<int>(
              value: 2,
              child: Text('2 un.',
                style: AppFontStyle.dropdownItem,),
            ),
            DropdownMenuItem<int>(
              value: 3,
              child: Text('3 un.',
                style: AppFontStyle.dropdownItem,),
            ),
            DropdownMenuItem<int>(
              value: 5,
              child: Text('5 un.',
                style: AppFontStyle.dropdownItem,),
            ),
            DropdownMenuItem<int>(
              value: 10,
              child: Text('10 un.',
                style: AppFontStyle.dropdownItem,),
            ),
          ],
          onChanged: (int? value) {
            setState(() {
              widget.dropdownValue = value!;
              _controller.setQuantity(id: widget.id, quantity: value);
            });
          }),
    );
  }
}
