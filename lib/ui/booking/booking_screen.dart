import 'package:actiday/ui/booking/mobile/booking_mobile.dart';
import 'package:actiday/ui/booking/web/booking_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => BookingMobile(),
      desktop: (context) => BookingWeb(),
      tablet: (context) {
        return OrientationBuilder(
            builder: (context, orientation){
              return orientation == Orientation.landscape ? BookingMobile() : BookingWeb();
            }
        );
      },
    );;
  }
}
