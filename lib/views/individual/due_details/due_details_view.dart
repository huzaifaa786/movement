import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:noobz/components/due_details_Column_card.dart';
import 'package:noobz/components/due_details_Row_card.dart';
import 'package:noobz/components/individual_profile_appbar.dart';
import 'package:noobz/components/main_button.dart';
import 'package:noobz/utils/colors.dart';

class DueDetailsView extends StatefulWidget {
  const DueDetailsView({super.key});

  @override
  State<DueDetailsView> createState() => _DueDetailsViewState();
}

class _DueDetailsViewState extends State<DueDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        IndividualProfileAppBar(name: 'Due details'),
        Padding(
          padding: const EdgeInsets.only(top: 54, left: 22),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset('assets/images/share.svg'),
              ),
              Text(
                'To',
                style: TextStyle(
                  color: blackgrey,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        DueDetailsRowCard(),
        DueDetailsColumnCard(),
        Gap(60),
        MainButton(
          isSelected: true,
          title: 'submit',
        )
      ],
    )));
  }
}
