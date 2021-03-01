import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class TicketModel {
  int id;
  bool isCollapsed;
  String logo;
  String startTime;
  String endTime;
  String startName;
  String endName;
  String airLineName;
  String destanceTime;
  int capacity;
  double off;
  FlutterMoneyFormatter price;
  FlutterMoneyFormatter oldPrice;
  double rate;

  TicketModel(
      {this.id,
      this.isCollapsed,
      this.logo,
      this.startTime,
      this.endTime,
      this.startName,
      this.endName,
      this.destanceTime,
      this.capacity,
      this.off,
      this.oldPrice,
      this.airLineName,
      this.rate,
      this.price});
}
