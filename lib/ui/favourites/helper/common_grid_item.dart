import 'package:actiday/framework/repositary/home/home.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:actiday/ui/utils/app_constants.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:actiday/framework/controller/favourites/favourites_controller.dart';

import '../../../framework/repositary/booking/booking.dart';

class CommonGridItem extends StatefulWidget {
  final String? id;
  final String? image;
  bool? isFavourite;
  final String? title;
  final String? subTitle;
  final String? address;
  final String? distance;
  final int? rating;
  final String? date;
  final int? credit;
  final GestureTapCallback? onMyTap;
  final GestureTapCallback? onButtonTap;
  String? status;

  CommonGridItem({
    super.key,
    this.id,
    required this.title,
    required this.subTitle,
    required this.image,
    this.address,
    this.isFavourite,
    this.credit,
    this.date,
    this.distance,
    this.rating,
    this.onMyTap,
    this.onButtonTap,
    this.status
  });

  @override
  State<CommonGridItem> createState() => _CommonGridItemState();
}

class _CommonGridItemState extends State<CommonGridItem> {
  // bool _isFavorited = false;

  // void toggleFavourite(){
  //   setState(() {
  //     wid = !_isFavorited;
  //   });
  // }
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  String dateConverter(String milliseconds) {
    String formattedDateTime = '';
    try {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
        int.parse(milliseconds),
      );

      formattedDateTime =
          "${date.year}-${date.month}-${date.day} ${date.hour == 0
              ? '12'
              : date.hour > 12
              ? date.hour - 12
              : date.hour}:${date.minute} ${date.hour > 12 ? 'PM' : 'AM'}";
    } catch (e) {
      return '';
    }
    return formattedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0x05000000),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 14 / 9,
                child: Image.network(
                  widget.image ?? 'assets/images/ic_banner1.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Visibility(
                visible: (widget.isFavourite != null),
                child: Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    onTap: widget.onMyTap,

                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: colorWhite,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: widget.isFavourite ?? false
                            ? colorPink
                            : colorGrey,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double titleSize = constraints.maxWidth > 150 ? 14 : 12;
                double subtitleSize = constraints.maxWidth > 150 ? 14 : 12;
                double ratingSize = constraints.maxWidth > 150 ? 12 : 10;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title ?? 'Error',
                            style: TextStyle(
                              fontSize: titleSize,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          Text(
                            widget.subTitle ?? '',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: subtitleSize,
                              fontWeight: FontWeight.w200,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          Visibility(
                            visible: widget.address != null,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: colorGrey,
                                  size: 15,
                                ),

                                Flexible(
                                  child: Visibility(
                                    child: Text(
                                      widget.address ?? '',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colorGrey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: widget.date != null,
                            child: Row(
                              children: [
                                // Icon(Icons.eighteen_mp),
                                SizedBox(height: 10),
                                Flexible(
                                  child: Text(
                                    dateConverter(widget.date ?? ''),
                                    style: TextStyle(
                                      fontSize: ratingSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Spacer(),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: widget.rating != null,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  (widget.rating.toString()),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Icon(Icons.star, color: colorPink, size: 16),
                              ],
                            ),
                          ),

                          Visibility(
                            visible: widget.credit != null,
                            child: Column(
                              children: [
                                CommonBoldText(
                                  label: "${widget.credit.toString()} Credit",
                                  size: 13,
                                ),
                                OutlinedButton(
                                  style: ButtonStyle(
                                    // maximumSize: WidgetStatePropertyAll(Size(5, 2)),
                                    side: WidgetStatePropertyAll(
                                      BorderSide(color: colorPink),
                                    ),
                                  ),
                                  onPressed: widget.onButtonTap,
                                  child: Text(
                                    widget.status ?? '',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
