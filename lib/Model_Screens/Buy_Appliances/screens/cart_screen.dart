import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Home_boarding_Screen/user.dart';
import '../../Home_boarding_Screen/phoneNumberProvider.dart';
import '../providers/all_providers.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';
// import '../providers/providers/cart.dart' show Cart;
// import '../providers/widgets/cart_item.dart';
// import '../providers/providers/orders.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final cartItems = cartProvider.cartItems;
    final phoneProvider = Provider.of<PhoneProvider>(context, listen: false);
    final phoneNumber = phoneProvider.getphoneNumber;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          // Card(
          //   margin: EdgeInsets.all(15),
          //   child: Padding(
          //     padding: EdgeInsets.all(8),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         Text(
          //           'Total',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         Spacer(),
          //         Chip(
          //           label: Text(
          //             '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
          //             style: TextStyle(
          //                 // color: Theme.of(context).primaryTextTheme.title.color,
          //                 ),
          //           ),
          //           backgroundColor: Theme.of(context).primaryColor,
          //         ),
          //         OrderButton(cart: Cart())
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (ctx, i) {
                  final cart = cartItems[i];
                  return Dismissible(
                    key: ValueKey(cart.id),
                    background: Container(
                      color: Theme.of(context).errorColor,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 40,
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 4,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) {
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Are you sure?'),
                          content: Text(
                            'Do you want to remove the item from the cart?',
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            ),
                            ElevatedButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.of(ctx).pop(true);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    onDismissed: (direction) {
                      Provider.of<CartProvider>(context, listen: false)
                          .removeItem(cart.id);
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 4,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                          leading: Image.network(cart.imageUrl),
                          title: Text(cart.title),
                          subtitle: Text(
                              'Total: \Rs.${(cart.price * cart.quantity)}'),
                          trailing: CircleAvatar(
                            child: Text(cart.quantity.toString()),
                          ),
                        ),
                      ),
                    ),
                  );
                  //   return CartItem(
                  //   cart.id,
                  //   cart.price,
                  //   cart.quantity,
                  //   cart.title,
                  // );
                }),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\Rs.${cartProvider.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('Place Order'),
            onPressed: () {
              ordersProvider.placeOrder(cartItems, phoneNumber);
              cartProvider.clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Order placed successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final phoneProvider = Provider.of<PhoneProvider>(context, listen: false);
    final phoneNumber = phoneProvider.getphoneNumber;

    final cartItems = cartProvider.cartItems;
    final ordersProvider = Provider.of<OrdersProvider>(context);
    return ElevatedButton(
      child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              ordersProvider.placeOrder(cartItems, phoneNumber);
              cartProvider.clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Order placed successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
              setState(() {
                _isLoading = false;
              });
              // widget.cart.clear();
            },
      // Color: Theme.of(context).primaryColor,
    );
  }
}
