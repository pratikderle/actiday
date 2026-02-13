import 'package:flutter/material.dart';

class FavouritesMobile extends StatefulWidget {
  const FavouritesMobile({super.key});

  @override
  State<FavouritesMobile> createState() => _FavouritesMobileState();
}

class _FavouritesMobileState extends State<FavouritesMobile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Favourites Mobile"),
    );
  }
}
