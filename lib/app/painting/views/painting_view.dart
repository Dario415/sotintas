import 'package:flutter/material.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/themes/app_font_style.dart';

class PaintingView extends StatelessWidget {
  const PaintingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.primary06,
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
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
                  'Como pintar',
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
              height: 30,
            ),
            paintingSteps(
              title: 'Prepare a tinta',
              body: 'Abra a tinta e a coloque na caçamba',
              number: '1',
              icon: 'assets/icons/paint_bucket.png',
            ),
            spacing(),
            paintingSteps(
              title: 'Primeira demão',
              body:
                  'Aplique a tinta na parede em N como mostrado no vídeo para melhor aproveitamento',
              number: '2',
              icon: 'assets/icons/brush.png',
            ),
            spacing(),
            Center(
              child: Icon(
                Icons.arrow_downward_rounded,
                size: 80,
                color: Colors.grey.shade400,
              ),
            ),
            spacing(),
            paintingSteps(
              title: 'Repasse a tinta',
              body:
                  'Passe mais uma camada de tinta por cima da parede para reduzir imperfeições',
              number: '3',
              icon: 'assets/icons/brush.png',
            ),
            spacing(),
            timer(),
            spacing(),
            paintingSteps(
              title: 'Segunda demão',
              body:
                  'Aplique a tinta na parede em N como mostrado no vídeo para melhor aproveitamento',
              number: '5',
              icon: 'assets/icons/brush.png',
            ),
            spacing(),
            paintingSteps(
              title: 'Repasse a tinta',
              body:
                  'Passe mais uma camada de tinta por cima da parede para reduzir imperfeições',
              number: '6',
              icon: 'assets/icons/brush.png',
            ),
            spacing(),
            timer(),
            spacing(),
            paintingSteps(
              title: 'Acabou',
              body: 'Sua parede está pronta',
              number: '7',
              icon: 'assets/icons/brush.png',
            ),
            spacing(),
          ],
        ),
      ),
    );
  }
}

Widget spacing() {
  return const SizedBox(
    height: 60,
  );
}

Widget timer() {
  return Column(
    children: [
      Center(
        child: Image.asset(
          'assets/icons/time.png',
          height: 45,
          width: 45,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Center(
        child: Text(
          'Aguarde 2 horas',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.lightBlack),
        ),
      )
    ],
  );
}

Widget paintingSteps({
  required String title,
  required String body,
  required String number,
  required String icon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 32,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(),
          Image.asset(
            icon,
            height: 25,
            width: 25,
          ),
          const SizedBox()
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 60, right: 30),
        child: Text(
          body,
          style: TextStyle(fontSize: 16, color: AppColors.lightBlack),
        ),
      )
    ],
  );
}
