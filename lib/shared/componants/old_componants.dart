// import 'package:flutter/material.dart';

// Widget buildOldBottomTab() =>  Stack(
//   children: [
//     Container(
//       width: double.infinity,
//       height: 1,
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//             color: Colors.white54,
//             blurRadius: 10,
//             spreadRadius: 3)
//       ]),
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//             onPressed: () {
//               cubit.getMatchCenter(date: editDateFormat(DateTime.parse(cubit.selectedDate).subtract(const Duration(days: 1)).toString().split(' ')[0]));
//             },
//             icon: Icon(
//               Icons.arrow_back_ios,
//               size: 30,
//             )),
//         Container(
//           height: double.infinity,
//           width: 5,
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//                 color: Colors.white54,
//                 blurRadius: 10,
//                 spreadRadius: 3)
//           ]),
//         ),
//         InkWell(
//           onTap: () {
//             showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime.parse('2010-01-01'),
//                 lastDate: DateTime.parse('2024-01-01'))
//                 .then((value) {
//               cubit.getMatchCenter(date: editDateFormatSlash(
//                   DateFormat.yMd().format(value!)));
//             });
//           },
//           child: Row(
//             children: [
//               Icon(
//                 Icons.calendar_month,
//                 color: Colors.grey[300],
//                 size: 30,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 cubit.selectedDate,
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[300]),
//               )
//             ],
//           ),
//         ),
//         Container(
//           height: double.infinity,
//           width: 5,
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//                 color: Colors.white54,
//                 blurRadius: 10,
//                 spreadRadius: 3)
//           ]),
//         ),
//         IconButton(
//             onPressed: () {
//               cubit.getMatchCenter(date: editDateFormat(DateTime.parse(cubit.selectedDate).add(const Duration(days: 1)).toString().split(' ')[0]));
//             },
//             icon: Icon(
//               Icons.arrow_forward_ios,
//               size: 30,
//             )),
//       ],
//     ),
//   ],
// );