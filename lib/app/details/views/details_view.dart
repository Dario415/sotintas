import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/themes/app_fonts.dart';
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
  @override
  void initState() {
    super.initState();
    _controller.getImages('1');
    _controller.getDifferentials('1');
  }

  List<ImagesModel> list = [];
  final _controller = GetIt.I.get<DetailsController>();

  Widget buildButtons({required String title, required bool isLeftRadius}) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: (MediaQuery.of(context).size.width / 2) - 32,
      decoration: BoxDecoration(
        color: AppColors.grey,
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
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          )),
    );
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
          padding: const EdgeInsets.all(24.0),
          child: Observer(builder: (context) {
            return Column(
              children: [
                const Text(
                  'NOME TINTA',
                  style: AppFonts.appbarTitle,
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                    color: AppColors.backgrundWhite,
                  ),
                  child: PageView(
                    children: _controller.imagesList.map((element) {
                      ImagesModel item = element;
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          'https://loremflickr.com/cache/resized/65535_51899560434_db250cda4c_b_640_480_nofilter.jpg',
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildButtons(
                      title: 'Como pintar',
                      isLeftRadius: true,
                    ),
                    buildButtons(
                      title: 'Tirar dúvidas',
                      isLeftRadius: false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                          const Text(
                            'Diferenciais',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              children:
                                  _controller.differentialsList.map((element) {
                                DifferentialsModel item = element;
                                return Container(
                                  margin: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Icon(Icons.diamond_outlined),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(item.name),
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
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                  height: 50,
                  width: double.maxFinite - 32,
                  title: 'Adicionar ao carrinho',
                  textColor: AppColors.white,
                  onPressed: () {},
                ),
              ],
            );
          }),
        ));
  }
}
