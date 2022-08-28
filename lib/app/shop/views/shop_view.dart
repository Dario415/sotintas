import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/routes/app_routes.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/themes/app_fonts.dart';
import 'package:sotintas/app/details/views/details_view.dart';
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
          !_controller.isLoading &&
          !_controller.onlyDeliveryFree) {
        _controller.getPaints();
      }
    });
    _controller.loadItens();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurpleWhite,
      appBar: AppBar(
        titleTextStyle: AppFonts.appbarTitle,
        elevation: 0,
        backgroundColor: AppColors.lightPurpleWhite,
        centerTitle: true,
        title: const Text(
          'Opções de tintas',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  label: Text('Pesquisa'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
              controller: _textEditingController,
              onSubmitted: (value) {
                _controller.searchPaints(value);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Observer(builder: (context) {
              return Row(
                children: [
                  Checkbox(
                      value: _controller.onlyDeliveryFree,
                      onChanged: (value) {
                        _controller.deliveryFreeOrNot(value);
                      }),
                  Text('Apenas entraga grátis',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  Expanded(
                    child: Container(),
                  ),
                  Text('${_controller.paintList.length} resultados',
                      style: TextStyle(color: Colors.grey.shade400)),
                ],
              );
            }),
            Expanded(
              child: Stack(
                children: [
                  Observer(builder: (context) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        final ShopModel paint = _controller.paintList[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                            color: AppColors.backgrundWhite,
                          ),
                          child: ListTile(
                            leading: Image.network(
                              'https://loremflickr.com/cache/resized/65535_51926625132_e4606ed580_z_640_480_nofilter.jpg',
                              fit: BoxFit.contain,
                            ),
                            title: Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Text(
                                paint.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 8, bottom: 16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'R\$ ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        paint.price,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                paint.deliveryFree
                                    ? Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.primary,
                                                width: 1),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            )),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 1,
                                        ),
                                        child: const Text(
                                          'Entrega grátis',
                                          style: TextStyle(),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
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
      ),
    );
  }
}
