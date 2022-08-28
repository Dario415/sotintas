import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/themes/app_fonts.dart';
import 'package:sotintas/app/profile/controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    _controller.getProfile();
  }

  final _controller = GetIt.I.get<ProfileController>();

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
          'Perfil',
        ),
      ),
      body: Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade400,
                  ),
                  color: AppColors.backgrundWhite,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        _controller.profile.avatar,
                        scale: 1
                      ),
                    ),
                    Text(
                      _controller.profile.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade400,
                  ),
                  color: AppColors.backgrundWhite,
                ),
                child: const Text(
                  'Fazer logout',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
