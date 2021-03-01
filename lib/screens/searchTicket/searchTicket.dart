import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:nega_trip/Helpers/ColorHelpers.dart';
import 'package:nega_trip/model/ticketModel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SearchTicket extends StatefulWidget {
  String mabda;
  String maghsad;
  String date;

  SearchTicket({this.mabda, this.maghsad, this.date});

  @override
  _SearchTicketState createState() => _SearchTicketState();
}

class _SearchTicketState extends State<SearchTicket> {
  Size size;

  double ticketDetailHeight = 0.0;

  bool isCollapsed = false;

  TextEditingController priceTextController = TextEditingController();

  List<TicketModel> ticketList = List<TicketModel>();

  setTicket() async {
    ticketList.add(
      TicketModel(
          id: 0,
          isCollapsed: false,
          logo: 'assets/images/homaLogo.png',
          capacity: 7,
          destanceTime: '1 س 45 د',
          endTime: '17:54',
          off: 3.0,
          price: FlutterMoneyFormatter(amount: 17500000),
          startTime: '10:50',
          rate: 4.5,
          startName: widget.mabda,
          endName: widget.maghsad,
          airLineName: 'هواپیمای هما',
          oldPrice: FlutterMoneyFormatter(amount: 1500000)),
    );
    ticketList.add(
      TicketModel(
          id: 1,
          isCollapsed: false,
          logo: 'assets/images/homaLogo.png',
          capacity: 7,
          destanceTime: '1 س 45 د',
          endTime: '17:54',
          off: 3.0,
          price: FlutterMoneyFormatter(amount: 17500000),
          startTime: '10:50',
          rate: 4.5,
          startName: widget.mabda,
          endName: widget.maghsad,
          airLineName: 'هواپیمای هما',
          oldPrice: FlutterMoneyFormatter(amount: 1500000)),
    );
    ticketList.add(
      TicketModel(
          id: 2,
          isCollapsed: false,
          logo: 'assets/images/homaLogo.png',
          capacity: 7,
          destanceTime: '1 س 45 د',
          endTime: '17:54',
          off: 3.0,
          price: FlutterMoneyFormatter(amount: 17500000),
          startTime: '10:50',
          rate: 4.5,
          startName: widget.mabda,
          endName: widget.maghsad,
          airLineName: 'هواپیمای هما',
          oldPrice: FlutterMoneyFormatter(amount: 1500000)),
    );
    ticketList.add(
      TicketModel(
          id: 3,
          isCollapsed: false,
          logo: 'assets/images/homaLogo.png',
          capacity: 7,
          destanceTime: '1 س 45 د',
          endTime: '17:54',
          off: 3.0,
          price: FlutterMoneyFormatter(amount: 17500000),
          startTime: '10:50',
          rate: 4.5,
          startName: widget.mabda,
          endName: widget.maghsad,
          airLineName: 'هواپیمای هما',
          oldPrice: FlutterMoneyFormatter(amount: 1500000)),
    );
    ticketList.add(
      TicketModel(
          id: 4,
          isCollapsed: false,
          logo: 'assets/images/homaLogo.png',
          capacity: 7,
          destanceTime: '1 س 45 د',
          endTime: '17:54',
          off: 3.0,
          price: FlutterMoneyFormatter(amount: 17500000),
          startTime: '10:50',
          rate: 4.5,
          startName: widget.mabda,
          endName: widget.maghsad,
          airLineName: 'هواپیمای هما',
          oldPrice: FlutterMoneyFormatter(amount: 1500000)),
    );
  }

  @override
  void initState() {
    setTicket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorHelpers.planeColor,
          child: Center(
            child: Icon(Icons.sort_outlined),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: ColorHelpers.planeColor,
                  expandedHeight: size.height * .2,
                  floating: false,
                  pinned: true,
                  title: AutoSizeText('انتخاب سفر'),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Container(
                      height: size.height * .2,
                      width: size.width,
                      color: ColorHelpers.planeColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AutoSizeText('${widget.mabda}' + '   به '),
                              SizedBox(
                                width: 8.0,
                              ),
                              AutoSizeText('${widget.maghsad}'),
                              SizedBox(
                                width: 8.0,
                              ),
                              AutoSizeText('${widget.date}'),
                              SizedBox(
                                width: 8.0,
                              ),
                              AutoSizeText('پنجشنبه'),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            width: size.width,
                            height: size.height * .06,
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 40.0,
                                          width: 40.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.black54,
                                            ),
                                          ),
                                          child: Center(
                                            child:
                                                Icon(Icons.double_arrow_sharp),
                                          ),
                                        ),
                                        AutoSizeText('روز بعد')
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: .5,
                                  color: Colors.black,
                                  margin: EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  height: double.maxFinite,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        AutoSizeText('روز قبل'),
                                        Container(
                                          height: 40.0,
                                          width: 40.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.black54,
                                            ),
                                          ),
                                          child: Center(
                                            child: Transform.rotate(
                                              angle: 3.1,
                                              child: Icon(
                                                Icons.double_arrow_sharp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              height: size.height,
              width: size.width,
              color: Colors.blue.withOpacity(.09),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: size.height,
                      width: size.width,
                      padding: EdgeInsets.only(bottom: size.height * .1),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: ticketList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildTicket(
                              index: index, item: ticketList[index]);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTicket({int index, TicketModel item}) {
    return GestureDetector(
      onTap: () {
        priceTextController.text = item.price.toString();
      },
      child: Container(
        width: size.width,
        height: size.height * .2,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          width: size.width,
          height: size.height * .17,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            children: [
              _buildFirstPartOfTicket(item: item),
              Container(
                  width: size.width * .06,
                  height: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -7.5,
                        child: Container(
                          height: 15.0,
                          width: 15.0,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(.09),
                              shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        bottom: -7.5,
                        child: Container(
                          height: 15.0,
                          width: 15.0,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(.09),
                              shape: BoxShape.circle),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 7.0,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.circle,
                              size: 7.0,
                              color: Colors.blue.withOpacity(.09),
                            ),
                            Icon(
                              Icons.circle,
                              size: 7.0,
                              color: Colors.blue.withOpacity(.09),
                            ),
                            Icon(
                              Icons.circle,
                              size: 7.0,
                              color: Colors.blue.withOpacity(.09),
                            ),
                            Icon(
                              Icons.circle,
                              size: 7.0,
                              color: Colors.blue.withOpacity(.09),
                            ),
                            Icon(
                              Icons.circle,
                              size: 7.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              _buildSecondPartOfTicket(item: item),
            ],
          ),
        ),
      ),
    );
  }

  _buildFirstPartOfTicket({TicketModel item}) {
    return Flexible(
      flex: 2,
      child: Container(
        height: double.maxFinite,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(item.logo),
                        height: 20.0,
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      AutoSizeText(
                        item.airLineName,
                        maxLines: 1,
                        maxFontSize: 14.0,
                        minFontSize: 6.0,
                        style: TextStyle(color: Colors.grey, fontSize: 10.0),
                      )
                    ],
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: SmoothStarRating(
                      rating: item.rate,
                      isReadOnly: true,
                      size: 10,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      defaultIconData: Icons.star_border,
                      starCount: 5,
                      allowHalfRating: true,
                      spacing: 2.0,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              item.endTime,
                              maxLines: 1,
                              maxFontSize: 26.0,
                              minFontSize: 16.0,
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AutoSizeText(
                              item.endName,
                              maxFontSize: 16.0,
                              minFontSize: 8.0,
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              item.destanceTime,
                              maxLines: 1,
                              maxFontSize: 16.0,
                              minFontSize: 6.0,
                              style: TextStyle(fontSize: 12.0),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Container(
                              height: 5.0,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (BuildContext context, int index) {
                                  return Transform.rotate(
                                    angle: 1.6,
                                    child: Icon(
                                      Icons.airplanemode_on_outlined,
                                      color: Colors.grey,
                                      size: 12.0,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              item.startTime,
                              maxLines: 1,
                              maxFontSize: 26.0,
                              minFontSize: 16.0,
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AutoSizeText(
                              item.startName,
                              maxFontSize: 16.0,
                              minFontSize: 8.0,
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildSecondPartOfTicket({TicketModel item}) {
    return Flexible(
      flex: 1,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_alert,
                        color: Colors.blue,
                        size: 18.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    'ظرفیت ${item.capacity} صندلی',
                    style: TextStyle(
                        fontSize: 12.0, color: ColorHelpers.colorOrange),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      item.price.output.withoutFractionDigits,
                      maxLines: 1,
                      maxFontSize: 14.0,
                      minFontSize: 8.0,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.redAccent,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: Colors.blue,
                            width: .5,
                          )),
                      child: AutoSizeText(
                        '${item.off} %',
                        maxLines: 1,
                        maxFontSize: 12.0,
                        minFontSize: 6.0,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      item.price.output.withoutFractionDigits,
                      maxLines: 1,
                      maxFontSize: 20.0,
                      minFontSize: 10.0,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    AutoSizeText(
                      'تومان',
                      maxLines: 1,
                      maxFontSize: 12.0,
                      minFontSize: 6.0,
                      style: TextStyle(fontSize: 10.0, color: Colors.grey),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
