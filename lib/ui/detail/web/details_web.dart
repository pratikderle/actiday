import 'package:actiday/framework/controller/base_screen/base_controller.dart';
import 'package:actiday/framework/repositary/booking/booking.dart';
import 'package:actiday/ui/base_screen/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../auth/login_screen.dart';
import '../../utils/app_color.dart';
import '../../utils/widgets/common_bold_text.dart';
import '../../utils/widgets/common_gradient_button.dart';
import '../../utils/widgets/common_outlined_button.dart';
import '../details_screen.dart';

class DetailsWeb extends StatefulWidget {
  final Past? modelGym;
  final int? index = 1;
  final Function(int)? onChanged;


  const DetailsWeb({super.key,this.onChanged, required this.modelGym});

  @override
  State<DetailsWeb> createState() => _DetailsWebState();
}

class _DetailsWebState extends State<DetailsWeb> {
  void displayDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(Icons.warning, size: 35, color: Colors.red,),
          title: Text("Are you sure? Do you want to log out", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false,
                );
              },
              child: Text("LogOut"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    print("----> ${widget.modelGym?.title}");
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: colorAppBar,
        leadingWidth: 120,
        leading: Padding(
          padding: EdgeInsets.only(left: 0.05 * screenWidth),
          child: Image.asset('assets/images/ic_logo.png', width: 80),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: BaseController().bottomNavigationList.map((item) {
            final bool isSelected = item.id == widget.index;
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BaseScreen()));
              },

              child: Text(
                item.label,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: isSelected ? 15 : 14,
                ),
              ),
            );
          }).toList(),
        ),

        actions: [
          Icon(Icons.search),
          SizedBox(width: 0.006 * screenWidth),
          Icon(Icons.notifications),
          SizedBox(width: 0.006 * screenWidth),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 0.006 * screenWidth),
          IconButton(onPressed: (){
            displayDialog();
          }, icon: Icon(Icons.logout)),

          SizedBox(width: 0.04 * screenWidth),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, viewPortConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              
              constraints: BoxConstraints(
                minHeight: viewPortConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  // color: colorGrey,
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //       icon: Icon(Icons.arrow_back_ios),
                      //     ),
                      //s
                      //     CommonBoldText(label: "Booking Details", size: 15),
                      //     SizedBox(width: 48),
                      //   ],
                      // ),

                      SizedBox(height: 20),
                      Row(
                        spacing: 30,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.67,
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    // BoxShadow(spreadRadius: 3, blurRadius: 1, color: Colors.grey),
                                  ],
                                  color: colorGrey,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 15,
                                                vertical: 5,
                                              ),
                                              child: Container(
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  color: colorWhite,
                                                  borderRadius: BorderRadius.circular(
                                                    10,
                                                  ),
                                                ),
                                                child: Image.network(
                                                  widget.modelGym?.image ?? '',
                                                  width: 74,
                                                  height: 75,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Flexible(child: SizedBox(height: 10,)),
                                                CommonBoldText(
                                                  label: widget.modelGym?.title ?? '',
                                                  size: 14,
                                                  color: colorBlack,
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color: Colors.grey,
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      widget.modelGym?.address ?? '',
                                                      style: TextStyle(fontSize: 12),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),

                                                    Text("  •  "),
                                                    CommonBoldText(
                                                      label:
                                                          widget.modelGym?.rating
                                                              .toString() ??
                                                          '',
                                                      size: 13,
                                                    ),
                                                    Icon(Icons.star, size: 16),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            OutlinedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                      colorWhite,
                                                    ),
                                                side: WidgetStatePropertyAll(
                                                  BorderSide(color: colorPink),
                                                ),
                                                fixedSize: WidgetStatePropertyAll(
                                                  Size(100, 22),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                widget.modelGym?.status ?? '',
                                                style: TextStyle(
                                                  color: colorBlack,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                          ],
                                        ),


                                      ],
                                    ),

                                    Divider(indent: 20, endIndent: 20),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        right: 20,
                                        top: 20,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    widget.modelGym?.category ?? '',
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.watch_later_outlined,
                                                        size: 15,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        widget.modelGym?.time ?? '',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Expanded(child: SizedBox()),

                                              CommonBoldText(
                                                label:
                                                    "${widget.modelGym?.credit.toString()} Credit" ??
                                                    '',
                                                size: 12,
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "Specialist",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              CommonBoldText(
                                                label:
                                                    widget.modelGym?.specialist ?? '',
                                                size: 12,
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "Time Slot",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              CommonBoldText(
                                                label:
                                                    widget.modelGym?.timeSlot ?? '',
                                                size: 12,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "Booking ID",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              CommonBoldText(
                                                label:
                                                    widget.modelGym?.bookingId ?? '',
                                                size: 12,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: CommonBoldText(
                                  label: "Payment Summary",
                                  size: 14,
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width * 0.67,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: colorGrey,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Booking Total",
                                          style: TextStyle(
                                            color: colorBlack,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        CommonBoldText(
                                          label: "${widget.modelGym?.credit} Credit",
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                    Divider(indent: 5, endIndent: 5),
                                    Row(
                                      children: [
                                        CommonBoldText(
                                          label: "Order Total",
                                          size: 12,
                                        ),
                                        Expanded(child: SizedBox()),
                                        CommonBoldText(
                                          label: "${widget.modelGym?.credit} Credit",
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: widget.modelGym?.status == 'Completed',
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                                  child: CommonBoldText(
                                    label: "Write Your Reviews",
                                    size: 14,
                                  ),
                                ),
                              ),


                              Visibility(
                                visible: widget.modelGym?.status == 'Completed',
                                child: Text(
                                  "Lorem Ipsum Has Been The Industry's Standard Ever",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Divider(),

                              Visibility(
                                visible: widget.modelGym?.status == 'Completed',
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonOutlinedButton(
                                      label: "Submit",
                                      textColor: colorWhite,
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      height: 40,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // tileMode: TileMode.mirror,
                                        colors: [
                                          Color(0xffFEC34D),
                                          Color(0xffF88C83),
                                          Color(0xffF25CB2),
                                          Color(0xffF048C6),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Visibility(
                            visible: widget.modelGym?.status == 'Completed',
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0x3f000000)),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 5,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                                    child: CommonBoldText(label: "Rate Us", size: 14),
                                  ),
                                  Row(
                                    children: [
                                      CommonGradientButton(
                                        onTap: () {
                                          setState(() {
                                            DetailsScreen.ratingIndex = 1;
                                          });
                                        },
                                        id: 1,
                                        width: 50,
                                        height: 50,
                                      ),
                                      SizedBox(width: 10),
                                      CommonBoldText(
                                        label: screenWidth < 600 ? DetailsScreen.qualityLabels[0] : '',
                                        size: 14,
                                        color: colorPink,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CommonGradientButton(
                                        onTap: () {
                                          setState(() {
                                            DetailsScreen.ratingIndex = 2;
                                          });
                                        },
                                        id: 2,
                                        width: 50,
                                        height: 50,
                                      ),
                                      SizedBox(width: 10),
                                      CommonBoldText(
                                        label: screenWidth < 600 ? DetailsScreen.qualityLabels[1] : '',
                                        size: 14,
                                        color: colorPink,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CommonGradientButton(
                                        onTap: () {
                                          setState(() {
                                            DetailsScreen.ratingIndex = 3;
                                          });
                                        },
                                        id: 3,
                                        width: 50,
                                        height: 50,
                                      ),
                                      SizedBox(width: 10),
                                      CommonBoldText(
                                        label: screenWidth < 600 ? DetailsScreen.qualityLabels[2] : '',
                                        size: 14,
                                        color: colorPink,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CommonGradientButton(
                                        onTap: () {
                                          setState(() {
                                            DetailsScreen.ratingIndex = 4;
                                          });
                                        },
                                        id: 4,
                                        width: 50,
                                        height: 50,
                                      ),
                                      SizedBox(width: 10),
                                      CommonBoldText(
                                        label: screenWidth < 600 ? DetailsScreen.qualityLabels[3] : '',
                                        size: 14,
                                        color: colorPink,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CommonGradientButton(
                                        onTap: () {
                                          setState(() {
                                            DetailsScreen.ratingIndex = 5;
                                          });
                                        },
                                        id: 5,
                                        width: 50,
                                        height: 50,
                                      ),
                                      SizedBox(width: 10),
                                      CommonBoldText(
                                        label: screenWidth < 600 ? DetailsScreen.qualityLabels[4] : '',
                                        size: 14,
                                        color: colorPink,
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   DetailsScreen.ratingIndex == 0
                                  //       ? ''
                                  //       : DetailsScreen.qualityLabels[DetailsScreen
                                  //                 .ratingIndex -
                                  //             1],
                                  //   style: TextStyle(color: colorPink),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Visibility(
                        visible: widget.modelGym?.status == 'Book',
                        child: Flexible(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                        ),
                      ),

                      Visibility(
                        visible: widget.modelGym?.status == 'Book',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonOutlinedButton(
                              label: "Cancel Booking",
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.2,
                              enableBorder: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      Container(
                        alignment: Alignment.center,
                        width: screenWidth,
                        height: 167,
                        decoration: BoxDecoration(color: colorBlack),

                        child: Row(
                          children: [
                            SizedBox(width: screenWidth * 0.01),
                            Flexible(
                              child: Text(
                                "copyright © 2020-22 Dreamplug Technologies Pvt Ltd.",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ),
                            Spacer(),
                            Flexible(
                              child: Text(
                                "privacy policy | terms and conditions | returns and refund",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
