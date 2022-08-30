import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/cart/views/cart_view.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/home/controller/home_controller.dart';
import 'package:sotintas/app/profile/views/profile_view.dart';
import 'package:sotintas/app/shop/views/shop_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = GetIt.I.get<HomeController>();
  late PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    PageController(initialPage: _controller.currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _controller.currentPage,
            selectedItemColor: AppColors.primary,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.storefront_outlined), label: 'Loja'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: 'Carrinho'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Perfil'),
            ],
            onTap: (index) {
              pageController.animateToPage(index,
                  duration: const Duration(seconds: 1), curve: Curves.ease);
            },
          ),
          body: PageView(
            onPageChanged: (index) {
              _controller.currentPage = index;
            },
            controller: pageController,
            children: const [
              ShopView(),
              CartView(),
              ProfileView(),
            ],
          ),
        );
      }
    );
  }
}
