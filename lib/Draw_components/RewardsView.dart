import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class RewardsView extends StatelessWidget {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Rewards"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: LottieBuilder.asset(
          "animations/no_bookings.json",
          //height: 500.h,
        ),
      ),
    );
  }
}
