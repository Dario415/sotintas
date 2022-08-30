import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/routes/app_routes.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/splash/controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _controller = GetIt.I.get<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 136, 121, 218),
              Color.fromARGB(255, 72, 59, 146),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/bucket_and_paint.png',
                  height: 58,
                  width: 58,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'SóTintas',
                  style: TextStyle(
                      fontSize: 36,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans'),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
                future: _controller.verifyToken(),
                builder: (context, snapshot) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data == true) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.login, (route) => false);
                    } else if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data == false) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.home, (route) => false);
                    }
                  });
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
