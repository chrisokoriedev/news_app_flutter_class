import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app_flutter_class/utils/contants.dart';

class HomePage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.pin_drop_rounded,
                    size: 20,
                    color: Color(0xfffd6a85),
                  ),
                  Gap(10),
                  Text(
                    'Abeokuta',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Gap(30),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(),
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Find interesting news',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: kPrimary,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                          child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              Gap(30),
              DefaultTabController(
                length: 5,
                child: Column(
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                          color: kPrimary,
                          borderRadius: BorderRadius.circular(30)),
                      tabs: [
                        buildTab('All'),
                        buildTab('Political'),
                        buildTab('Sport'),
                        buildTab('Tech'),
                        buildTab('Shopping'),
                      ],
                    ),
                    Container(
                      height: 500,
                      child: TabBarView(children: [
                        Text('Home'),
                        Text('Home'),
                        Text('Home'),
                        Text('Home'),
                        Text('Home'),
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Tab buildTab(String title) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
