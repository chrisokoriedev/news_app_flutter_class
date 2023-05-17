// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:news_app_flutter_class/controller/recommendation_controller.dart';
// import 'package:news_app_flutter_class/utils/contants.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final NewsController controller =
//       Get.put(NewsController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(
//                     Icons.pin_drop_rounded,
//                     size: 20,
//                     color: Color(0xfffd6a85),
//                   ),
//                   Gap(10),
//                   Text(
//                     'Abeokuta',
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//               const Gap(30),
//               TextField(
//                 decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(),
//                     prefixIcon: const Icon(Icons.search),
//                     hintText: 'Find interesting news',
//                     hintStyle: const TextStyle(color: Colors.grey),
//                     suffixIcon: Container(
//                       width: 100,
//                       decoration: BoxDecoration(
//                           color: kPrimary,
//                           borderRadius: BorderRadius.circular(30)),
//                       child: const Center(
//                           child: Text(
//                         'Search',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       )),
//                     ),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30))),
//               ),
//               Gap(30),
//               DefaultTabController(
//                 length: 5,
//                 child: Column(
//                   children: [
//                     TabBar(
//                       indicatorSize: TabBarIndicatorSize.tab,
//                       isScrollable: true,
//                       labelColor: Colors.white,
//                       unselectedLabelColor: Colors.grey,
//                       indicator: BoxDecoration(
//                           color: kPrimary,
//                           borderRadius: BorderRadius.circular(30)),
//                       tabs: [
//                         buildTab('All'),
//                         buildTab('Political'),
//                         buildTab('Sport'),
//                         buildTab('Tech'),
//                         buildTab('Shopping'),
//                       ],
//                     ),
//                     // if (controller.status==Status.loading) const CircularProgressIndicator() else Obx(() {
//                     //         return SizedBox(
//                     //           height: 500,
//                     //           child: TabBarView(children: [
//                     //             Column(
//                     //               children: [
//                     //                 SizedBox(
//                     //                   height: 300,
//                     //                   child: CardSwiper(
//                     //                     cardsCount:
//                     //                         controller.recommendations.length,
//                     //                     cardBuilder: (context, index) {
//                     //                       final article = controller
//                     //                           .recommendations[index];
//                     //                       return Container(
//                     //                         alignment: Alignment.center,
//                     //                         decoration: BoxDecoration(
//                     //                             image: DecorationImage(
//                     //                                 image:
//                     //                                     CachedNetworkImageProvider(
//                     //                                         article
//                     //                                             .urlToImage))),
//                     //                         child: const Text('1'),
//                     //                         color: Colors.blue,
//                     //                       );
//                     //                     },
//                     //                   ),
//                     //                 ),
//                     //               ],
//                     //             ),
//                     //             Text('Home'),
//                     //             Text('Home'),
//                     //             Text('Home'),
//                     //             Text('Home'),
//                     //           ]),
//                     //         );
//                     //       })
//                     GetBuilder<NewsController>(
//                       init: controller,
//                       builder: (_) {
//                         if (_.isLoading.value) {
//                           return Center(child: CircularProgressIndicator());
//                         }
//
//                         return ListView.builder(
//                           itemCount: _.articles.length,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             final article = _.articles[index];
//                             return ListTile(
//                               leading: Image.network(article.title),
//                               title: Text(article.title),
//                               subtitle: Text(article.country),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
//
//   Tab buildTab(String title) {
//     return Tab(
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }
