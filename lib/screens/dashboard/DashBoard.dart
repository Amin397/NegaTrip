import 'dart:async';
import 'dart:math' as math;

import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nega_trip/screens/busTicket/busTicket.dart';
import 'package:nega_trip/screens/planeTicket/PlaneTicket.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Size size;
  List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    height: size.height * .35,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(i),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                // Material(
                //   elevation: 8.0,
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(12.0),
                //     bottomRight: Radius.circular(12.0),
                //   ),
                //   child: Container(
                //     width: size.width,
                //     height: size.height * .35,
                //     child: Stack(
                //       children: [
                //         PageView.builder(
                //           itemCount: images.length,
                //           controller: imagePageController,
                //           onPageChanged: (page) {
                //             setState(() {
                //               currentPage = page;
                //             });
                //           },
                //           itemBuilder: (BuildContext context, int index) {
                //             return ClipRRect(
                //               borderRadius: BorderRadius.only(
                //                 bottomLeft: Radius.circular(12.0),
                //                 bottomRight: Radius.circular(12.0),
                //               ),
                //               child: Image(
                //                 fit: BoxFit.cover,
                //                 image: AssetImage(images[index]),
                //               ),
                //             );
                //           },
                //         ),
                //         Center(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               AutoSizeText(
                //                 'نگاتریپ',
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 34.0,
                //                   fontWeight: FontWeight.w600,
                //                 ),
                //               ),
                //               AutoSizeText(
                //                 'سامانه خرید بلیط هواپیما و اتوبوس آنلاین',
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontSize: 16.0,
                //                     fontWeight: FontWeight.w600
                //                 ),
                //               ),
                //               SizedBox(height: size.height * .05,)
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: size.height * .02,
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        _buildPlaneTrip(),
                        _buildBusTrip(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaneTrip() {
    return Align(
      alignment: Alignment.centerLeft,
      child: OpenContainer(
        closedElevation: 20,
        openColor: Color(0xff1687a7),
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        closedColor: Color(0xff1687a7),
        openBuilder: (context, _) {
          return PlaneTicket();
        },
        closedBuilder: (context, VoidCallback openContainer) {
          return GestureDetector(
            onTap: openContainer,
            child: Container(
              width: size.width * .85,
              decoration: BoxDecoration(
                color: Color(0xff1687a7),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(44.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Hero(
                      tag: 'planeTag',
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Image(
                          image: AssetImage('assets/images/plane.png'),
                        ),
                      ),
                    ),
                  ),
                  AutoSizeText(
                    'خرید بلیط هواپیما',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBusTrip() {
    return Align(
      alignment: Alignment.bottomRight,
      child: OpenContainer(
        closedElevation: 20,
        openColor: Color(0xff726a95),
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        closedColor: Color(0xff726a95),
        openBuilder: (context, _) {
          return BusTicket();
        },
        closedBuilder: (context, VoidCallback openContainer) {
          return GestureDetector(
            onTap: openContainer,
            child: Container(
              height: size.height * .3,
              width: size.width * .85,
              decoration: BoxDecoration(
                color: Color(0xff726a95),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(44.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Hero(
                      tag: 'busTag',
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Image(
                          image: AssetImage('assets/images/bus.png'),
                        ),
                      ),
                    ),
                  ),
                  AutoSizeText('خرید بلیط اتوبوس',
                      style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
