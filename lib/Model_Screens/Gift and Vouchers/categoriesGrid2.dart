import 'package:flutter/material.dart';

class CategoriesGrid_ extends StatelessWidget {
  final String imageUrl;
  final String ImageText;
  const CategoriesGrid_(
      {super.key, required this.imageUrl, required this.ImageText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue, width: 1)),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    imageUrl,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20),
                  ),
                  Text(ImageText)
                ]),
          )),
    );
  }
}
