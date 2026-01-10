import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';

class PostivAndNigativButtom extends StatefulWidget {
  const PostivAndNigativButtom({super.key, required this.title});
  final String title;
  @override
  State<PostivAndNigativButtom> createState() => _PostivAndNigativButtomState();
}

class _PostivAndNigativButtomState extends State<PostivAndNigativButtom> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        Text(widget.title, style: TextStyles.bold16),
        Row(
          mainAxisSize: .min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (counter > 0) counter--;
                });
              },
              icon: const Icon(
                FontAwesomeIcons.circleMinus,
                color: AppColors.primary,
              ),
            ),

            Text("$counter", style: TextStyles.bold16),

            IconButton(
              onPressed: () {
                setState(() {
                  if (counter < 15) counter++;
                });
              },
              icon: const Icon(
                FontAwesomeIcons.circlePlus,
                color: AppColors.primary,
                size: 26,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
