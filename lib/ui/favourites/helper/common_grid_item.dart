import 'package:actiday/framework/repositary/home/home.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:flutter/material.dart';

import '../../../framework/repositary/booking/booking.dart';

class CommonGridItem extends StatefulWidget {
  // String strImageSrc;
  // String strTitle;
  // String strSubtitleFirst;
  // String strSubtitleSecond;
  // CommonGridItem({required this.strImageSrc,required this.strTitle, required this.strSubtitleFirst, required this.strSubtitleSecond, super.key});
  // final List<TopClass>? items;
  final TopClass? modelTopClass;
  final Past? modelPast;

  const CommonGridItem({
     required this.modelTopClass,
     required this.modelPast,
    super.key,
  });

  @override
  State<CommonGridItem> createState() => _CommonGridItemState();
}

class _CommonGridItemState extends State<CommonGridItem> {

  @override
  void initState() {
    setState(() {

    });
    super.initState();
  }

  // String? dateConverter(String date){
  //   if (date.isNotEmpty) {
  //     int millisecondsEpoch = int.parse(date);
  //     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsEpoch);
  //
  //     return dateTime.toString();
  //   }
  //   return '';
  // }
  @override
  Widget build(BuildContext context) {

    final dynamic model = widget.modelTopClass ?? widget.modelPast;
    print("--->type ${model.runtimeType}");
    // if (model is Past) {
    //   print("--->"+
    //     model is Past ? model.image : model.subTitle,
    //   );
    // }
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
                  model.image ?? 'assets/images/ic_banner1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: colorWhite,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.pink, size: 18),
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
                double ratingSize = constraints.maxWidth > 150 ? 14 : 12;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.title ?? 'Error',
                            style: TextStyle(
                              fontSize: titleSize,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            model is Past
                                ? model.subTitle.join(' • ')
                                : model.subTitle ?? "Lady Fit",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: subtitleSize,
                              fontWeight: FontWeight.w200,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          Visibility(
                            visible: model is TopClass,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: colorGrey,
                                  size: 15,
                                ),

                                Flexible(
                                  child: Text(
                                    model is Past
                                        ? ''
                                        : model.address ??
                                              "Arabian Gulf st 2 km",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: colorGrey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: model is Past,
                            child: Row(
                              children: [
                                // Text(dateConverter(model.date) ?? '')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: model is TopClass,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "4.5",
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
                          visible: model is Past,
                          child: Column(
                            children: [
                              CommonBoldText(
                                label: model is Past
                                    ? "Credit ${model.credit}"
                                    : '',
                                size: 13,
                              ),
                              Spacer(),
                              OutlinedButton(
                                onPressed: () {},
                                child: Text("Booked"),
                              ),
                            ],
                          ),
                        ),
                      ],
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
