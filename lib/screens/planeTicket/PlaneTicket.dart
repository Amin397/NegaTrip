import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nega_trip/Helpers/ColorHelpers.dart';
import 'package:nega_trip/Helpers/WidgetHelper.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class PlaneTicket extends StatefulWidget {
  @override
  _PlaneTicketState createState() => _PlaneTicketState();
}

class _PlaneTicketState extends State<PlaneTicket> {
  Size size;

  TextEditingController mabdaController = TextEditingController();
  TextEditingController maghsadController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  int _currentStep = 0;

  bool maghsadCompleted = false;

  bool dakheli = false;

  int typeId;

  bool isReturn = false;

  int countOld = 1;

  int sumPassenger = 1;

  int countYoung = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            color: Color(0xff1687a7),
            child: Column(
              children: [
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Icon(Icons.arrow_forward_ios , ),
                //   ),
                // ),
                _buildImage(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildStepper(),
                        _buildoption(),
                        _buildAnimatation(),
                      ],
                    ),
                  ),
                ),
                _buildSearchButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        children: [
          Hero(
            tag: 'planeTag',
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Image(
                image: AssetImage('assets/images/plane.png'),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .03,
          ),
          AutoSizeText(
            'خرید بلیط هواپیما',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _buildStepper() {
    return Container(
      width: size.width,
      child: Stepper(
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  if (_currentStep == 2) {
                    setState(() {
                      maghsadCompleted = true;
                    });
                  } else {
                    onStepContinue();
                  }
                },
                child: AutoSizeText(
                  (_currentStep == 3) ? 'ثبت' : 'ادامه',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.redAccent,
              ),
              SizedBox(
                width: size.width * .05,
              ),
              _currentStep == 0
                  ? Container()
                  : OutlineButton(
                      onPressed: onStepCancel,
                      child: const AutoSizeText(
                        'برگشت',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ],
          );
        },
        type: StepperType.vertical,
        currentStep: _currentStep,
        physics: ScrollPhysics(),
        onStepTapped: (int step) => setState(() => _currentStep = step),
        onStepContinue:
            _currentStep < 2 ? () => setState(() => _currentStep += 1) : null,
        onStepCancel:
            _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
        steps: <Step>[
          Step(
            state: (_currentStep > 0)
                ? StepState.complete
                : (_currentStep < 0)
                    ? StepState.indexed
                    : StepState.editing,
            title: AutoSizeText('تاریخ رفت'),
            content: Container(
              width: size.width,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext _) {
                      return PersianDateTimePicker(
                        color: Colors.orangeAccent,
                        initial: '1399/12/09',
                        type: 'date',
                        onSelect: (date) {
                          setState(() {
                            birthDateController.text = date;
                          });
                        },
                      );
                    },
                  );
                },
                child: WidgetHelper.textFormField(
                  size: size,
                  controller: birthDateController,
                  h: .05,
                  w: 1,
                  label: 'تاریخ رفت',
                  maxLines: 1,
                  numeric: false,
                  enable: false,
                ),
              ),
            ),
          ),
          Step(
            isActive: true,
            state: (_currentStep > 1)
                ? StepState.complete
                : (_currentStep < 1)
                    ? StepState.indexed
                    : StepState.editing,
            title: AutoSizeText('تعداد مسافران'),
            content: Container(
              width: size.width,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 1),
                        borderRadius: BorderRadius.circular(8.0)),
                    height: size.height * .05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            addPassengerOld();
                          },
                          child: Container(
                            margin: EdgeInsets.all(2.0),
                            height: double.maxFinite,
                            width: size.width * .1,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(.9),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              '$countOld مسافر',
                              style: TextStyle(color: Colors.white),
                            ),
                            AutoSizeText(
                              '  (12 سال به بالا)',
                              maxLines: 1,
                              maxFontSize: 12.0,
                              minFontSize: 4.0,
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 9.0),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            decPassengerOld();
                          },
                          onLongPress: (){
                            setState(() {
                              countOld = 1;
                              sumPassenger = countOld;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(2.0),
                            height: double.maxFinite,
                            width: size.width * .1,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 1),
                        borderRadius: BorderRadius.circular(8.0)),
                    height: size.height * .05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            addPassengerYoung();
                          },
                          child: Container(
                            margin: EdgeInsets.all(2.0),
                            height: double.maxFinite,
                            width: size.width * .1,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(.9),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              '$countYoung مسافر',
                              style: TextStyle(color: Colors.white),
                            ),
                            AutoSizeText(
                              '  (12 سال به بالا)',
                              maxLines: 1,
                              maxFontSize: 12.0,
                              minFontSize: 4.0,
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 9.0),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            decPassengerYoung();
                          },
                          onLongPress: (){
                            setState(() {
                              countYoung = 1;
                              sumPassenger = countYoung;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(2.0),
                            height: double.maxFinite,
                            width: size.width * .1,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Step(
            isActive: true,
            state: (_currentStep > 2)
                ? StepState.complete
                : (_currentStep < 2)
                    ? StepState.indexed
                    : StepState.editing,
            title: AutoSizeText('مبداء'),
            content: Container(
              width: size.width,
              child: Column(
                children: [
                  WidgetHelper.textFormField(
                    size: size,
                    borderRadius: 12.0,
                    controller: mabdaController,
                    w: 1,
                    h: .05,
                    numeric: false,
                    label: 'مبداء',
                    enable: true,
                    maxLines: 1,
                    borderColor: Color(0xff1687a7),
                  )
                ],
              ),
            ),
          ),
          Step(
            isActive: true,
            state: (_currentStep > 3)
                ? StepState.complete
                : (_currentStep < 3)
                    ? StepState.indexed
                    : StepState.editing,
            title: AutoSizeText('مقصد'),
            content: Container(
              width: size.width,
              child: Column(
                children: [
                  WidgetHelper.textFormField(
                    size: size,
                    borderRadius: 12.0,
                    controller: maghsadController,
                    w: 1,
                    h: .05,
                    numeric: false,
                    label: 'مقصد',
                    enable: true,
                    maxLines: 1,
                    borderColor: Color(0xff1687a7),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatation() {
    return Container(
      width: size.width,
      height: size.height * .1,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (maghsadCompleted &&
                  _currentStep == 2 &&
                  mabdaController.text.isNotEmpty)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.my_location,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    AutoSizeText(
                      maghsadController.text,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              : Container(),
          (maghsadCompleted &&
                  _currentStep == 2 &&
                  maghsadController.text.isNotEmpty)
              ? Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: double.maxFinite,
                            height: .9,
                            color: Colors.white,
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: 1.6,
                            child: Icon(
                              Icons.airplanemode_on_outlined,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
          (mabdaController.text.isNotEmpty && _currentStep > 1)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    AutoSizeText(
                      mabdaController.text,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildoption() {
    return Container(
      width: size.width,
      height: size.height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WidgetHelper.sspRadioGroup(
            title: ['داخلی', 'خارجی'],
            value: [1, 2],
            valueSelect: typeId,
            isVertical: true,
            direction: TextDirection.rtl,
            callback: (vS, tS, iS) {
              setState(
                () {
                  typeId = vS;
                  print(typeId.toString());
                },
              );
            },
          ),
          Container(
            width: size.width * .4,
            height: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    activeColor: ColorHelpers.colorOrange,
                    value: isReturn,
                    onChanged: (value) {
                      setState(() {
                        isReturn = value;
                      });
                    }),
                AutoSizeText(
                  (isReturn) ? 'دوطرفه' : 'یک طرفه',
                  maxLines: 1,
                  maxFontSize: 20.0,
                  minFontSize: 10.0,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: size.width,
          height: size.height * .05,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: AutoSizeText(
              'جست و جو',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void addPassengerOld() {
    setState(() {
      if(sumPassenger>=9){

      }else{
        setState(() {
          countOld++;
          sumPassenger = sumPassenger + 1;
        });
      }
    });
  }

  void decPassengerOld() {
    if(sumPassenger <= 1){
      print('amin');
    }else if(countOld == 1){
      print('amin');
    }else{
      setState(() {
        countOld--;
        sumPassenger --;
      });
    }
  }

  void addPassengerYoung() {
    setState(() {
      if(sumPassenger>=9){
        print('hassan');
      }else{
        setState(() {
          countYoung++;
          sumPassenger = sumPassenger + 1;
        });
      }
    });
  }

  void decPassengerYoung() {
    if(sumPassenger <= 1){
      print('amin');
    }else if(countYoung == 1){
      print('amin');
    }else{
      setState(() {
        countYoung--;
        sumPassenger --;
      });
    }
  }
}
