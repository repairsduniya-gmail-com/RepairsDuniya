import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final String imageUrl;
  final String TextWidget;
  const ListWidget(
      {super.key, required this.imageUrl, required this.TextWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(

          // padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          width: 130,
          height: 100,
          child:
              // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //   Center(
              //     child: Text(
              //       TextWidget,
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   )
              // ]),
              Container(
            width: 150,
            height: 100,
            child: Image.asset(
              'screen_assets/ss3.png',
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
