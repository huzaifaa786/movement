import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noobz/utils/colors.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
           padding: const EdgeInsets.all(6.0),
           
      
       width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(19)),
              color: lightGrey,),
       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Due type',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Text(
              'Due Type',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Text(
              'Amount',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Row(
              children: [
                SvgPicture.asset('assets/images/tick.svg'),
                Text(
                  '   view',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: mainColor),
                ),
                
              ],
            ),
            
          ],
        ),
          
      ),
    );
  }
}
