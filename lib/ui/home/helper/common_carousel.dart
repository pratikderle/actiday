import 'package:actiday/ui/utils/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CommonCarousel extends StatefulWidget {
  final bool showCarouselIndicator;
  const CommonCarousel({this.showCarouselIndicator = true, super.key});

  @override
  State<CommonCarousel> createState() => _CommonCarouselState();
}

class _CommonCarouselState extends State<CommonCarousel> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            Image.asset('assets/images/ic_carousel_banner.png'),
            Image.asset('assets/images/ic_carousel_banner.png'),
            Image.asset('assets/images/ic_carousel_banner.png'),
          ],
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                currIndex = index;
              });
            },


            height: 250,
            // aspectRatio: 16/9,
            viewportFraction: 1,
            disableCenter: true,
            reverse: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
          ),
        ),
        Visibility(
          visible: widget.showCarouselIndicator,
          child: DotsIndicator(
            dotsCount: 3,
            position: currIndex.toDouble(),

            decorator: DotsDecorator(
              size: Size.fromRadius(4),
              activeColor: colorBlack,
              color: colorGrey,
              activeSize: Size(50, 5),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
