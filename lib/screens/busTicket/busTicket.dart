import 'package:flutter/material.dart';
import 'dart:math'as math;


class BusTicket extends StatefulWidget {
  @override
  _BusTicketState createState() => _BusTicketState();
}

class _BusTicketState extends State<BusTicket> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            color: Color(0xff726a95),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
