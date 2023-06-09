import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:repair_duniya/Model_Screens/Gift%20and%20Vouchers/GreenButton.dart';
import 'package:repair_duniya/Model_Screens/Gift%20and%20Vouchers/categoriesGrid2.dart';
import 'package:repair_duniya/Model_Screens/Gift%20and%20Vouchers/listWidget.dart';
import 'package:repair_duniya/Model_Screens/Gift%20and%20Vouchers/titleRow.dart';

class myVoucher extends StatefulWidget {
  const myVoucher({super.key});

  @override
  State<myVoucher> createState() => _myVoucherState();
}

class _myVoucherState extends State<myVoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(children: <Widget>[
            // ListTile(
            //   tileColor: Colors.black,
            //   title: Text(
            //     'Good Afternoon \n John Dahner',
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            //   trailing: CircleAvatar(
            //     backgroundColor: Colors.white,
            //     child: Icon(
            //       Icons.notifications,
            //       color: Colors.teal,
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
            ),
            Container(
              height: 300,
              // color: Colors.black,
              child: Image.asset(
                'screen_assets/rewards3.jpg',
                fit: BoxFit.cover,
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GreenButton(
                          buttonText: 'NEARBY OFFERS',
                          borderColor: Colors.blue,
                          Textcolor: Colors.blue,
                          buttonColor: Colors.white,
                        ),
                        GreenButton(
                          buttonText: 'ONLINE OFFERS',
                          borderColor: Colors.blue,
                          Textcolor: Colors.white,
                          buttonColor: Colors.blue,
                        ),
                      ],
                    ),
                    TitleRow(title: 'Your Rewards'),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text('Points Earned'),
                          subtitle: Text(
                            '2334 points',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    TitleRow(title: 'Reedem Now'),
                    Container(
                      child: GridView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2 / 2,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 2),
                        children: <Widget>[
                          CategoriesGrid_(
                              imageUrl: '\$226', ImageText: 'Cashback won'),
                          CategoriesGrid_(
                              imageUrl: '46', ImageText: 'My Vouchers'),
                          CategoriesGrid_(
                              imageUrl: '1,153', ImageText: 'cashback points'),
                        ],
                      ),
                    ),
                    // TitleRow(title: 'Hey John, you might like this'),
                    // Padding(
                    //   padding: EdgeInsets.all(10),
                    //   child: Container(
                    //     padding: EdgeInsets.all(10),
                    //     decoration: BoxDecoration(
                    //         color: Color.fromARGB(255, 32, 165, 243),
                    //         borderRadius: BorderRadius.circular(15),
                    //         border: Border.all(
                    //             color: Color.fromARGB(255, 165, 222, 248))),
                    //     // height: 400,
                    //     child: Container(
                    //       // height: 300,
                    //       child: Column(children: <Widget>[
                    //         Row(
                    //           children: [
                    //             Text(
                    //               'Order your welcome kit for FREE',
                    //               style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 17,
                    //                   fontWeight: FontWeight.bold),
                    //             )
                    //           ],
                    //         ),
                    //         GridView(
                    //           physics: NeverScrollableScrollPhysics(),
                    //           shrinkWrap: true,
                    //           gridDelegate:
                    //               SliverGridDelegateWithFixedCrossAxisCount(
                    //             crossAxisCount: 2,
                    //             childAspectRatio: 2 / 2,
                    //             mainAxisSpacing: 6,
                    //             crossAxisSpacing: 6,
                    //           ),
                    //           children: <Widget>[
                    //             Flexible(
                    //               child: Column(
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 children: [
                    //                   Row(
                    //                     children: [
                    //                       Text(
                    //                         'welcome kit includes',
                    //                         style: TextStyle(
                    //                             color: Colors.white,
                    //                             fontWeight: FontWeight.bold),
                    //                       )
                    //                     ],
                    //                   ),
                    //                   // Expanded(
                    //                   ListView(
                    //                     shrinkWrap: true,
                    //                     padding: EdgeInsets.all(5),
                    //                     // physics:
                    //                     //     NeverScrollableScrollPhysics(),
                    //                     children: [
                    //                       Text(
                    //                         '- Free bankly badge',
                    //                         style:
                    //                             TextStyle(color: Colors.white),
                    //                       ),
                    //                       Text(
                    //                         '- Free bankly T-shirt',
                    //                         style:
                    //                             TextStyle(color: Colors.white),
                    //                       ),
                    //                       Text(
                    //                         '- More freebies',
                    //                         style:
                    //                             TextStyle(color: Colors.white),
                    //                       )
                    //                     ],
                    //                   ),

                    //                   Container(
                    //                     width: 130,
                    //                     height: 40,
                    //                     decoration: BoxDecoration(
                    //                         color: Color.fromARGB(
                    //                             255, 107, 217, 245),
                    //                         borderRadius:
                    //                             BorderRadius.circular(20)),
                    //                     child: TextButton(
                    //                         onPressed: () {},
                    //                         child: Text(
                    //                           'Order Now',
                    //                           style: TextStyle(
                    //                               color: Colors.white),
                    //                         )),
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //             // Expanded(
                    //             //     child:
                    //             //         Image.asset('assets/images/misc.png')),
                    //           ],
                    //         ),
                    //       ]),
                    //     ),
                    //   ),
                    // ),
                    TitleRow(title: 'Scratch-Cards'),
                    Container(
                      height: 160,
                      width: double.infinity,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        scrollDirection: Axis.horizontal,
                        children: [
                          ListWidget(
                              imageUrl: 'screen_assets/scratchCard.jpeg',
                              TextWidget: '20% OFF'),
                          ListWidget(
                              imageUrl: 'screen_assets/scratchCard.jpeg',
                              TextWidget: '5% OFF'),
                          ListWidget(
                              imageUrl: 'screen_assets/scratchCard.jpeg',
                              TextWidget: '10% OFF'),
                          ListWidget(
                              imageUrl: 'screen_assets/scratchCard.jpeg',
                              TextWidget: '5% OFF')
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Buy your subscription\n',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: 'only for 299/-\n',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Buy now',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                              // Container(
                              //     width: 100,
                              //     height: 100,
                              //     child: Center(
                              //       child: Image.asset(''),
                              //     ))
                            ],
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: SingleChildScrollView(
//             child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20),
//                 child: Column(children: <Widget>[
//                   // ListTile(
//                   //   tileColor: Colors.black,
//                   //   title: Text(
//                   //     'Good Afternoon \n John Dahner',
//                   //     style: TextStyle(
//                   //       color: Colors.white,
//                   //     ),
//                   //   ),
//                   //   trailing: CircleAvatar(
//                   //     backgroundColor: Colors.white,
//                   //     child: Icon(
//                   //       Icons.notifications,
//                   //       color: Colors.teal,
//                   //     ),
//                   //   ),
//                   // ),
//                   Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Center(
//                       child: Container(
//                           color: Colors.black,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text.rich(
//                                     TextSpan(style: TextStyle(), children: [
//                                       TextSpan(
//                                         text: 'Total Balance\n',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: 'Rs. 234,300.32\n',
//                                         style: TextStyle(
//                                             color: Colors.white, fontSize: 22),
//                                       ),
//                                     ]),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                       child: new Container(
//                                           margin: const EdgeInsets.only(
//                                               left: 10.0, right: 20.0),
//                                           child: Divider(
//                                             color: Color.fromARGB(
//                                                 255, 201, 194, 194),
//                                             // height: 36,
//                                           )))
//                                 ],
//                               ),
//                               // Row(
//                               //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               //   children: <Widget>[
//                               //     BlackButton(parameter: 'Pay >'),
//                               //     BlackButton(
//                               //       parameter: 'Add +',
//                               //     )
//                               //   ],
//                               // ),
//                             ],
//                           )),
//                     ),
//                   ),
//                   Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 25),
//                         child: Column(children: <Widget>[
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 Container(
//                                     width: 150,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(15),
//                                         // color: buttonColor,
//                                         border: Border.all(color: Colors.blue)),
//                                     child: TextButton(
//                                         onPressed: () {},
//                                         child: Text(
//                                           '200 points',
//                                           style: TextStyle(
//                                               // color: Textcolor
//                                               ),
//                                         ))),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Colors.white,
//                                   ),
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(vertical: 25),
//                                     child: Column(
//                                       children: <Widget>[
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceEvenly,
//                                           children: <Widget>[
//                                             Container(
//                                                 width: 150,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             15),
//                                                     // color: buttonColor,
//                                                     border: Border.all(
//                                                         color: Colors.blue)),
//                                                 child: TextButton(
//                                                     onPressed: () {},
//                                                     child: Text(
//                                                       '200 points',
//                                                       style: TextStyle(
//                                                           // color: Textcolor
//                                                           ),
//                                                     ))),

//                                             // GreenButton(
//                                             //   buttonText: 'History',
//                                             //   borderColor: Colors.teal,
//                                             //   Textcolor: Colors.white,
//                                             //   buttonColor: Colors.teal,
//                                             // ),
//                                           ],
//                                         ),
//                                         TitleRow(title: 'Your Rewards'),
//                                         // Padding(
//                                         //   padding: EdgeInsets.all(5),
//                                         //   child: Container(
//                                         //     decoration: BoxDecoration(
//                                         //         border: Border.all(
//                                         //             color: Colors.purple),
//                                         //         borderRadius:
//                                         //             BorderRadius.circular(10)),
//                                         //     child: ListTile(
//                                         //       contentPadding:
//                                         //           EdgeInsets.all(10),
//                                         //       title: Text('Entertainment'),
//                                         //       subtitle: Text(
//                                         //         '2334 points',
//                                         //         style: TextStyle(
//                                         //             color: Colors.purple,
//                                         //             fontSize: 25,
//                                         //             fontWeight:
//                                         //                 FontWeight.bold),
//                                         //       ),
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                         TitleRow(title: 'Explore Categoies'),
//                                         // Container(
//                                         //   child: GridView(
//                                         //     physics:
//                                         //         NeverScrollableScrollPhysics(),
//                                         //     shrinkWrap: true,
//                                         //     gridDelegate:
//                                         //         SliverGridDelegateWithFixedCrossAxisCount(
//                                         //       crossAxisCount: 2,
//                                         //       childAspectRatio: 2 / 2,
//                                         //       mainAxisSpacing: 3,
//                                         //       crossAxisSpacing: 2,
//                                         //     ),
//                                         //     children: <Widget>[
//                                         //       CategoriesGrid_(
//                                         //           imageUrl:
//                                         //               'assets/images/food.jpeg',
//                                         //           ImageText: 'Food'),
//                                         //       CategoriesGrid_(
//                                         //           imageUrl:
//                                         //               'assets/images/travel.png',
//                                         //           ImageText: 'Travel'),
//                                         //       CategoriesGrid_(
//                                         //           imageUrl:
//                                         //               'assets/images/shop.png',
//                                         //           ImageText: 'Shopping'),
//                                         //       CategoriesGrid_(
//                                         //           imageUrl:
//                                         //               'assets/images/books.png',
//                                         //           ImageText: 'Eduation'),
//                                         //     ],
//                                         //   ),
//                                         // ),
//                                         TitleRow(
//                                             title:
//                                                 'Hey John, you might like this'),
//                                         Padding(
//                                           padding: EdgeInsets.all(20),
//                                           child: Container(
//                                             padding: EdgeInsets.all(10),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.teal,
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                                 border: Border.all(
//                                                     color: Colors.teal)),
//                                             // height: 400,
//                                             child: Container(
//                                               // height: 300,
//                                               child: Column(children: <Widget>[
//                                                 Row(
//                                                   children: [
//                                                     Text(
//                                                       'Order your welcome kit for FREE',
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 17,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     )
//                                                   ],
//                                                 ),
//                                                 GridView(
//                                                   physics:
//                                                       NeverScrollableScrollPhysics(),
//                                                   shrinkWrap: true,
//                                                   gridDelegate:
//                                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                                     crossAxisCount: 2,
//                                                     childAspectRatio: 2 / 2,
//                                                     mainAxisSpacing: 10,
//                                                     crossAxisSpacing: 10,
//                                                   ),
//                                                   children: <Widget>[
//                                                     Flexible(
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.min,
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               Text(
//                                                                 'welcome kit includes',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .white,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold),
//                                                               )
//                                                             ],
//                                                           ),
//                                                           // Expanded(
//                                                           ListView(
//                                                             shrinkWrap: true,
//                                                             padding:
//                                                                 EdgeInsets.all(
//                                                                     5),
//                                                             // physics:
//                                                             //     NeverScrollableScrollPhysics(),
//                                                             children: [
//                                                               Text(
//                                                                 '- Free bankly badge',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .white),
//                                                               ),
//                                                               Text(
//                                                                 '- Free bankly T-shirt',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .white),
//                                                               ),
//                                                               Text(
//                                                                 '- More freebies',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .white),
//                                                               )
//                                                             ],
//                                                           ),

//                                                           Container(
//                                                             width: 130,
//                                                             height: 40,
//                                                             decoration: BoxDecoration(
//                                                                 color: Color
//                                                                     .fromARGB(
//                                                                         255,
//                                                                         73,
//                                                                         255,
//                                                                         7),
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             20)),
//                                                             child: TextButton(
//                                                                 onPressed:
//                                                                     () {},
//                                                                 child: Text(
//                                                                   'Order Now',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .white),
//                                                                 )),
//                                                           )
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     // Expanded(
//                                                     //     child: Image.asset(
//                                                     //         'assets/images/misc.png')),
//                                                   ],
//                                                 ),
//                                               ]),
//                                             ),
//                                           ),
//                                         ),
//                                         TitleRow(title: 'Use Bankly and get'),
//                                         Container(
//                                           height: 200,
//                                           width: double.infinity,
//                                           child: ListView(
//                                             padding: EdgeInsets.all(20),
//                                             scrollDirection: Axis.horizontal,
//                                             children: [
//                                               ListWidget(
//                                                   imageUrl:
//                                                       'assets/images/playstroe.png',
//                                                   TextWidget: '20% OFF'),
//                                               ListWidget(
//                                                   imageUrl:
//                                                       'assets/images/credit2.png',
//                                                   TextWidget: '5% OFF'),
//                                               ListWidget(
//                                                   imageUrl:
//                                                       'assets/images/food2 (2).png',
//                                                   TextWidget: '10% OFF'),
//                                               ListWidget(
//                                                   imageUrl:
//                                                       'assets/images/tickets.png',
//                                                   TextWidget: '5% OFF')
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.all(10),
//                                           child: Container(
//                                             padding: EdgeInsets.all(10),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.teal,
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                                 border: Border.all(
//                                                     color: Colors.teal)),
//                                             child: Column(children: [
//                                               Row(
//                                                 children: [
//                                                   RichText(
//                                                     text: TextSpan(children: [
//                                                       TextSpan(
//                                                           text:
//                                                               'Bring your card at home\n',
//                                                           style: TextStyle(
//                                                             color: Colors.white,
//                                                             fontSize: 20,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                           )),
//                                                       TextSpan(
//                                                           text:
//                                                               'only for 299/-\n',
//                                                           style: TextStyle(
//                                                             color: Colors.white,
//                                                             fontSize: 20,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                           )),
//                                                     ]),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 children: [
//                                                   Container(
//                                                     width: 150,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.white,
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20)),
//                                                     child: TextButton(
//                                                         onPressed: () {},
//                                                         child: Text(
//                                                           'Book now',
//                                                           style: TextStyle(
//                                                               color:
//                                                                   Colors.black),
//                                                         )),
//                                                   ),
//                                                   Container(
//                                                       width: 100,
//                                                       height: 100,
//                                                       child: Center(
//                                                         child: Image.asset(
//                                                             'assets/images/credit2.png'),
//                                                       ))
//                                                 ],
//                                               )
//                                             ]),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ]),
//                         ]),
//                       ))
//                 ]))));
//   }
// }
