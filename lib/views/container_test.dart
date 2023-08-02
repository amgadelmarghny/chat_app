// import 'package:codmego_chat/helper/constants.dart';
// import 'package:flutter/material.dart';

// class ContainerView extends StatefulWidget {
//   const ContainerView({super.key});
//   static String id = 'dfdg';

//   @override
//   State<ContainerView> createState() => _ContainerViewState();
// }



// class _ContainerViewState extends State<ContainerView> {
//   bool click = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 250,
//           width: 160,
//           decoration:
//               BoxDecoration(borderRadius: BorderRadius.circular(7), boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(.3),
//               blurRadius: 30,
//               spreadRadius: 30,
//               //offset: Offset(15, 20),
//             )
//           ]),
//           child: Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             elevation: 20,
//             // margin: const EdgeInsets.all(8),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.asset(kLogo),
//                     const Text('Codmego'),
//                     const Text('price : Priceless'),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     const Spacer(
//                       flex: 1,
//                     ),
//                     const Divider(
//                       height: 0,
//                       indent: 10,
//                       endIndent: 10,
//                       color: Colors.grey,
//                       thickness: 3,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                             enableFeedback: true,
//                             onPressed: () {
//                               setState(() {
//                                 click = !click;
//                               });
//                             },
//                             icon: const IconTheme(
//                               data: IconThemeData(color: Colors.red),
//                               child: Icon(
//                                click? Icons.favorite_border: Icons.favorite,
//                                 color:click ? Colors.white: Colors.red,
//                               ),
//                             ),
//                           )
//                       ],
//                     )
//                   ]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
