import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key,
    this.title,
    this.onTap,
    this.isSelected = false,
    this.buttonWidth = 0.9,
  }) : super(key: key);

  final title;
  final onTap;
  final buttonWidth;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelected ? onTap : (){},
      child: Container(
        width: MediaQuery.of(context).size.width * buttonWidth,
        height: 65,
        decoration: BoxDecoration(color: isSelected ? mainColor : darkGrey,borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: white),)),
      ),
    );
  }
}
