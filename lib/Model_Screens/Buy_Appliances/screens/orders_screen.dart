// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:repair_duniya/Model_Screens/Buy_Appliances/providers/all_providers.dart';

// import '../providers/orders.dart' show Orders, OrdersProvider;
// import '../widgets/order_item.dart';
// // import '../widgets/app_drawer.dart';

// class OrdersScreen extends StatelessWidget {
//   static const routeName = '/orders';

//   @override
//   Widget build(BuildContext context) {
//     print('building orders');
//     // final orderData = Provider.of<Orders>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Orders'),
//       ),
//       // drawer: AppDrawer(),
//       body: FutureBuilder(
//         future: Provider.of<OrdersProvider>(context, listen: false).placeOrder(order),
//         builder: (ctx, dataSnapshot) {
//           if (dataSnapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             if (dataSnapshot.error != null) {
//               // ...
//               // Do error handling stuff
//               return Center(
//                 child: Text('An error occurred!'),
//               );
//             } else {
//               return Consumer<OrdersProvider>(
//                 builder: (ctx, orderData, child) => ListView.builder(
//                   itemCount: orderData.orders.length,
//                   itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
//                 ),
//               );
//             }
//           }
//         },
//       ),
//     );
//   }
// }
