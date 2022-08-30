import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/cart/controller/cart_controller.dart';
import 'package:sotintas/app/cart/views/cart_view.dart';
import 'package:sotintas/app/core/data/local_data.dart';
import 'package:sotintas/app/core/repository/app_repository.dart';
import 'package:sotintas/app/core/utils/routes/app_routes.dart';
import 'package:sotintas/app/details/controller/details_controller.dart';
import 'package:sotintas/app/details/views/details_view.dart';
import 'package:sotintas/app/home/controller/home_controller.dart';
import 'package:sotintas/app/home/views/home_view.dart';
import 'package:sotintas/app/login/controllers/login_controller.dart';
import 'package:sotintas/app/login/view/login_view.dart';
import 'package:sotintas/app/painting/views/painting_view.dart';
import 'package:sotintas/app/profile/controller/profile_controller.dart';
import 'package:sotintas/app/profile/views/profile_view.dart';
import 'package:sotintas/app/registration/controller/registration_controller.dart';
import 'package:sotintas/app/registration/view/registration_view.dart';
import 'package:sotintas/app/shop/controller/shop_controller.dart';
import 'package:sotintas/app/shop/views/shop_view.dart';
import 'package:sotintas/app/splash/controller/splash_controller.dart';
import 'package:sotintas/app/splash/views/splash_view.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<AppRepository>(AppRepository(Dio()));
  getIt.registerSingleton<LocalData>(LocalData());
  getIt.registerSingleton<SplashController>(SplashController());
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<ShopController>(ShopController());
  getIt.registerSingleton<CartController>(CartController());
  getIt.registerSingleton<DetailsController>(DetailsController());
  getIt.registerSingleton<ProfileController>(ProfileController());
  getIt.registerSingleton<RegistrationController>(RegistrationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
      debugShowCheckedModeBanner: false,
      title: 'Só Tintas',
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashView(),
        AppRoutes.login: (context) => const LoginView(),
        AppRoutes.home: (context) => const HomeView(),
        AppRoutes.shop: (context) => const ShopView(),
        AppRoutes.details: (context) => const DetailsView(),
        AppRoutes.cart: (context) => const CartView(),
        AppRoutes.profile: (context) => const ProfileView(),
        AppRoutes.registration: (context) => const RegistrationView(),
        AppRoutes.painting: (context) => const PaintingView(),
      },
    );
  }
}
