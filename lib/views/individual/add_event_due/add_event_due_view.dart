// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:noobz/components/event_name_container.dart';
// import 'package:noobz/components/main_input.dart';
// import 'package:noobz/components/topbbar.dart';
// import 'package:noobz/utils/colors.dart';

// enum Day { day }

// class AddEventDueView extends StatefulWidget {
//   const AddEventDueView({Key? key}) : super(key: key);

//   @override
//   State<AddEventDueView> createState() => _AddEventDueViewState();
// }

// List<String> options = ['Day', 'Weekly', 'Monthly'];
// List<String> weekdays = ["M", "T", "W", "TH", "F", "S", "S"];

// Color activeCardColor = Colors.white;
// Color inactiveCardColor = Colors.black26;

// Color activeTextColor = Colors.black;
// Color inactiveTextColor = Colors.white;

// List<List<Color>> cardColorList = [
//   [Colors.black26, Colors.white],
//   [Colors.black26, Colors.white],
//   [Colors.black26, Colors.white],
//   [Colors.black26, Colors.white],
//   [Colors.black26, Colors.white],
//   [Colors.black26, Colors.white],
//   [Colors.black26, Colors.white],
// ];

// class _AddEventDueViewState extends State<AddEventDueView> {
//   String Currentoption = options[0];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         forceMaterialTransparency: true,
//         title: TitleTopBar(
//           name: 'Add Client',
//           ontap: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: SafeArea(
//           child: Column(
//         children: [
//           Column(children: [
//             EventNameContainer(),
//             Padding(
//               padding: const EdgeInsets.only(left: 30, right: 30),
//               child: MainInput(),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 32, top: 33),
//               child: Row(
//                 children: [
//                   Text(
//                     'Reminder pattern',
//                     style: TextStyle(
//                       color: darkGrey,
//                       fontSize: 14,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               title: const Text('Day'),
//               leading: Radio(
//                 activeColor: mainColor,
//                 value: options[0],
//                 groupValue: Currentoption,
//                 onChanged: (value) {
//                   setState(() {
//                     Currentoption = value.toString();
//                   });
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 50,
//               width: double.infinity,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//         itemCount: weekdays.length,
//                 itemBuilder:(BuildContext context, int index) {
//           return Container(
//             margin: const EdgeInsets.only(left: 5, right: 5),
//             height: 70,
//             width: 50,
//             decoration: BoxDecoration(
//                 color: cardColorList[index][0],
//                 borderRadius: const BorderRadius.all(Radius.circular(10))
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(height: 10,),
//                 Text(weekdays[index], style: TextStyle(fontSize: 18, color: cardColorList[index][1], fontWeight: FontWeight.bold),),
//               ],
//             ),
//           );
//         },
//       ), ),
//           ],
//             ListTile(
//               title: const Text('Weekly'),
//               leading: Radio(
//                 activeColor: mainColor,
//                 value: options[1],
//                 groupValue: Currentoption,
//                 onChanged: (value) {
//                   setState(() {
//                     Currentoption = value.toString();
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title: const Text('Monthly'),
//               leading: Radio(
//                 splashRadius: 20,
//                 activeColor: mainColor,
//                 value: options[2],
//                 groupValue: Currentoption,
//                 onChanged: (value) {
//                   setState(() {
//                     Currentoption = value.toString();
//                   });
//                 },
//               ),
//             ),
//           ],),
//         ],
//       )),
//     );
//   }
// }
