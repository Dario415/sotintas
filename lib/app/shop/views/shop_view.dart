import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/shop/controller/shop_controller.dart';
import 'package:sotintas/app/shop/models/shop_model.dart';

class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  final _controller = GetIt.I.get<ShopController>();
  late final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_controller.isLoading) {
        _controller.getPaints();
      }
    });
    _controller.getPaints();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text('Pesquisa')),
            controller: _textEditingController,
            onSubmitted: (value) {
              _controller.searchPaints(value);
            },
          ),
          SizedBox(
            height: 16,
          ),
          Text('Entraga grátis'),
          Container(
            child: Observer(builder: (context) {
              return Checkbox(
                  value: _controller.onlyDeliveryFree,
                  onChanged: (value) {
                    _controller.deliveryFreeOrNot(value);
                  });
            }),
          ),
          Expanded(
            child: Stack(
              children: [
                Observer(builder: (context) {
                  return ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      final ShopModel paint = _controller.paintList[index];
                      return ListTile(
                        title: Text(paint.name),
                        subtitle: Text(paint.price),
                        trailing: paint.deliveryFree
                            ? const Text('Entrega Grátis')
                            : const SizedBox(),
                      );
                    },
                    itemCount: _controller.paintList.length,
                  );
                }),
                Observer(builder: (context) {
                  return _controller.isLoading
                      ? Positioned(
                          left: (MediaQuery.of(context).size.width / 2) - 20,
                          bottom: 24,
                          child: const CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      : Container();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
