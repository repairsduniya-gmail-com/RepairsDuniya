import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: const Text(
          "Balance & History",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/material.jpeg'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 15),
                  height: MediaQuery.of(context).size.height / 7,
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Image.asset(
                          'assets/icons8-wallet-58.png',
                          width: 40,
                        ),
                        title: const Text('Repair Wallet Balance'),
                        subtitle: const Text('Powered by Paytm Bank'),
                        trailing: Text(
                          "₹ 2000",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, top: 20, bottom: 5),
                  child: Text(
                    'Payment History',
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width - 40,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      //boxShadow: [
                      //   BoxShadow(
                      //       offset: Offset(2, 2),
                      //       blurRadius: 4,
                      //       color: Color(0xffb5b3b3))
                      // ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search payments ',
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        border: InputBorder.none,
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/history1.jpg',
                            width: 50,
                          ),
                          title: Text(
                            'Payment to Panasonic 7kg Washing Machine',
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Today, 07:50 PM',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          trailing: Text(
                            "- ₹30,990",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/history1.jpg',
                            width: 50,
                          ),
                          title: Text(
                            'Payment to Panasonic 7kg Washing Machine',
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Today, 07:50 PM',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          trailing: Text(
                            "- ₹30,990",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/history1.jpg',
                            width: 50,
                          ),
                          title: Text(
                            'Payment to Panasonic 7kg Washing Machine',
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Today, 07:50 PM',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          trailing: Text(
                            "- ₹30,990",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/history1.jpg',
                            width: 50,
                          ),
                          title: Text(
                            'Payment to Panasonic 7kg Washing Machine',
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Today, 07:50 PM',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          trailing: Text(
                            "- ₹30,990",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      //   child: Divider(thickness: 1,color: Colors.white70,),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
