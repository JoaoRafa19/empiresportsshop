import 'package:carousel_slider/carousel_slider.dart';
import 'package:empiresportsweb/modules/web/widgets/background_carrousel_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static CarouselController carouselController = CarouselController();
  static ScrollController _scrollController = ScrollController();

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    HomePage._scrollController.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: NestedScrollView(
          controller: HomePage._scrollController,
          headerSliverBuilder: (BuildContext headerContext, bool innerBox) {
            return [
              SliverAppBar(
                title: Text(
                  'Empire Sports Shop',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
                pinned: true,
                floating: true,
                forceElevated: innerBox,
                bottom: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  controller: tabController,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.home_rounded, color: Colors.black),
                      child: Text("Home", style: TextStyle(color: Colors.black)),
                    ),
                    Tab(
                      icon: Icon(Icons.info_rounded, color: Colors.black),
                      child: Text("Sobre nós", style: TextStyle(color: Colors.black)),
                    ),
                    Tab(
                      icon: Icon(Icons.phone_rounded, color: Colors.black),
                      child: Text("Contato", style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [
              Icon(Icons.home),
              Icon(Icons.info),
              Icon(Icons.phone),
            ],
          )),
    );
  }
}
