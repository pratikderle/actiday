import 'package:actiday/ui/detail/details_screen.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:actiday/ui/utils/widgets/common_gradient_button.dart';
import 'package:actiday/ui/utils/widgets/common_outlined_button.dart';
import 'package:actiday/ui/utils/widgets/common_text_gradient.dart';
import 'package:flutter/material.dart';

import '../../../framework/repositary/booking/booking.dart';

class DetailsMobile extends StatefulWidget {
  final Past? modelGym;

  const DetailsMobile({super.key, required this.modelGym});

  @override
  State<DetailsMobile> createState() => _DetailsMobileState();
}

class _DetailsMobileState extends State<DetailsMobile> {
  @override
  void initState() {
    super.initState();
    DetailsScreen.ratingIndex = 6;

  }
  @override
  Widget build(BuildContext context) {
    print("----> ${widget.modelGym?.title}");
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, viewPortConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewPortConstraints.minHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  color: colorGrey,
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),

                          CommonBoldText(label: "Booking Details", size: 15),
                          SizedBox(width: 48),
                        ],
                      ),

                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            // BoxShadow(spreadRadius: 3, blurRadius: 1, color: Colors.grey),
                          ],
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 100),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonBoldText(
                                              label:
                                                  widget.modelGym?.title ?? '',
                                              size: 14,
                                              color: colorBlack,
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.grey,
                                                  size: 18,
                                                ),
                                                Text(
                                                  widget.modelGym?.address ??
                                                      '',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 10),
                                    Container(
                                      width: double.infinity,
                                      height: 40,
                                      color: Color(0x1f000000),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 100),
                                          CommonBoldText(
                                            label:
                                                widget.modelGym?.rating
                                                    .toString() ??
                                                '',
                                            size: 13,
                                          ),
                                          Icon(Icons.star, size: 16),
                                          const Expanded(child: SizedBox()),
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
                                          SizedBox(width: 16),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  left: 15,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: colorWhite,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.network(
                                      widget.modelGym?.image ?? '',
                                      width: 74,
                                      height: 75,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),

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
                                                style: TextStyle(fontSize: 10),
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
                                        label: widget.modelGym?.timeSlot ?? '',
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
                                        label: widget.modelGym?.bookingId ?? '',
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
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: colorWhite,
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
                                CommonBoldText(label: "Order Total", size: 12),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: CommonBoldText(label: "Rate Us", size: 14),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CommonGradientButton(
                                    onTap: (){
                                      setState(() {
                                        DetailsScreen.ratingIndex = 1;
                                      });
                                    },
                                    id: 1,
                                    width: 50, height: 50),
                                CommonGradientButton(
                                    onTap: (){
                                      setState(() {
                                        DetailsScreen.ratingIndex = 2;
                                      });
                                    },
                                    id: 2, width: 50, height: 50),
                                CommonGradientButton(
                                    onTap: (){
                                      setState(() {
                                        DetailsScreen.ratingIndex = 3;
                                      });
                                    },
                                    id: 3, width: 50, height: 50),
                                CommonGradientButton(
                                    onTap: (){
                                      setState(() {
                                        DetailsScreen.ratingIndex = 4;
                                      });
                                    },
                                    id: 4, width: 50, height: 50),
                                CommonGradientButton(
                                    onTap: (){
                                      setState(() {
                                        DetailsScreen.ratingIndex = 5;
                                      });
                                    },
                                    id: 5, width: 50, height: 50),
                                Text(DetailsScreen.ratingIndex == 0? '' : DetailsScreen.qualityLabels[DetailsScreen.ratingIndex - 1] , style: TextStyle(color: colorPink),)
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 10,
                              ),
                              child: CommonBoldText(
                                label: "Write Your Reviews",
                                size: 14,
                              ),
                            ),
                            Text(
                              "Lorem Ipsum Has Been The Industry's Standard Ever",
                              style: TextStyle(fontSize: 12),
                            ),
                            Divider(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonOutlinedButton(
                                  label: "Submit",
                                  textColor: colorWhite,
                                  width: MediaQuery.of(context).size.width * 0.8,
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
                          ],
                        ),
                      ),

                      Visibility(
                        visible: widget.modelGym?.status == 'Book',
                        child: Flexible(child: SizedBox(height: MediaQuery.of(context).size.height * 0.2)),
                      ),

                      Visibility(
                        visible: widget.modelGym?.status == 'Book',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonOutlinedButton(
                              label: "Cancel Booking",
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.8,
                              enableBorder: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
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
