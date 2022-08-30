import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/routes/app_routes.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/themes/app_font_style.dart';
import 'package:sotintas/app/core/utils/widgets/custom_backgrund.dart';
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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        titleTextStyle: AppFontStyle.appbarTitle,
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          'Opções de tintas',
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            CustomBackgrund(constraints: constraints),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: AppColors.lightGrey,
                      ),
                      hintText: 'Buscar...',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: AppColors.lightGrey80,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
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
                        Switch(
                          activeColor: AppColors.primary,
                          inactiveTrackColor: AppColors.lightGrey80,
                          inactiveThumbColor:  AppColors.primary,
                            value: _controller.onlyDeliveryFree,
                            onChanged: (value) {
                              _controller.deliveryFreeOrNot(value);
                            }),
                        Text('Apenas entraga grátis',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                            )),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          '${_controller.paintList.length} resultados',
                          style: TextStyle(
                            color: AppColors.grey40,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  }),
                  Expanded(
                    child: Stack(
                      children: [
                        Observer(builder: (context) {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              final ShopModel paint =
                                  _controller.paintList[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.details,
                                    arguments: {
                                      'name': paint.name,
                                      'id': paint.id,
                                    },
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors.lightGrey40,
                                    ),
                                    color: AppColors.white80,
                                  ),
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(7)),
                                      child: Image.network(
                                        paint.coverImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    title: Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      child: Text(
                                        paint.name,
                                        style: AppFontStyle.cardTitle,
                                      ),
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'R\$ ',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: AppColors.lightBlack,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                paint.price,
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  color: AppColors.lightBlack,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        paint.deliveryFree
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            AppColors.primary,
                                                        width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(5),
                                                    )),
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                ),
                              );
                            },
                            itemCount: _controller.paintList.length,
                          );
                        }),
                        Observer(builder: (context) {
                          return _controller.isLoading
                              ? Positioned(
                                  left:
                                      (MediaQuery.of(context).size.width / 2) -
                                          20,
                                  bottom: 24,
                                  child: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      backgroundColor: AppColors.purpleWhite,
                                      color: AppColors.primary,
                                    ),
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
          ],
        );
      }),
    );
  }
}
