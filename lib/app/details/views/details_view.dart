import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/routes/app_routes.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/themes/app_font_style.dart';
import 'package:sotintas/app/core/utils/widgets/custom_button.dart';
import 'package:sotintas/app/details/controller/details_controller.dart';
import 'package:sotintas/app/details/models/differentials_model.dart';
import 'package:sotintas/app/details/models/images_model.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  Map<String, String> paint = {};
  List<ImagesModel> list = [];
  final _controller = GetIt.I.get<DetailsController>();
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.85,
  );

  Widget buildButtons(
      {required String title, required bool isLeftRadius, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: (MediaQuery.of(context).size.width / 2) - 32,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: isLeftRadius
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
        ),
        child: Text(title,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    paint = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    _controller.getImages(paint['id']!);
    _controller.getDifferentials(paint['id']!);
    return Scaffold(
        backgroundColor: AppColors.white,
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              color: AppColors.primary06,
              child: Observer(builder: (context) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_rounded),
                        ),
                        Text(
                          'Opçoes de tintas',
                          style: TextStyle(
                              fontSize: 26,
                              color: AppColors.lightBlack,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      paint['name']!,
                      style: AppFontStyle.appbarTitle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 220,
                      width: double.maxFinite,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            physics: const BouncingScrollPhysics(),
                            itemCount: _controller.imagesList.length,
                            itemBuilder: (context, index) {
                              ImagesModel image =
                                  _controller.imagesList[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(11)),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey.shade400,
                                  ),
                                  color: AppColors.backgrundWhite,
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.network(
                                    image.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            top: 75,
                            left: MediaQuery.of(context).size.width * .08,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                size: 40,
                                color: AppColors.black20,
                              ),
                              onPressed: () {
                                if ((_pageController.page!.round() + 1) >
                                    1) {
                                  _pageController.animateToPage(
                                      _pageController.page!.round() - 1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              },
                            ),
                          ),
                          Positioned(
                            top: 75,
                            right: MediaQuery.of(context).size.width * .11,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_rounded,
                                size: 40,
                                color: AppColors.black20,
                              ),
                              onPressed: () {
                                if (_pageController.page!.round() + 1 <
                                    _controller.imagesList.length) {
                                  _pageController.animateToPage(
                                      _pageController.page!.round() + 1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildButtons(
                            title: 'Como pintar',
                            isLeftRadius: true,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.painting);
                            },
                          ),
                          buildButtons(
                            title: 'Tirar dúvidas',
                            isLeftRadius: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade400,
                          ),
                          color: AppColors.backgrundWhite,
                        ),
                        child: Observer(builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Diferenciais',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.lightBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  child: Column(
                                    children: _controller.differentialsList
                                        .map((element) {
                                      DifferentialsModel item = element;
                                      return Container(
                                        margin: const EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            differentialsIcon(),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              item.name,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomButton(
                        height: 60,
                        width: double.maxFinite,
                        title: 'Adicionar ao carrinho',
                        textStyle: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                        onPressed: () {
                          _controller.addToCart(id: paint['id']!);
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
        }));
  }
}

Widget differentialsIcon() {
  var rng = Random();
  int index = rng.nextInt(3);

  if (index == 1) {
    return Image.asset('assets/icons/wind.png');
  }
  if (index == 2) {
    return Image.asset('assets/icons/paint_bucket.png');
  }
  return Image.asset('assets/icons/brush.png');
}
