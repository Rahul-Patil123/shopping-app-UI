import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete Item'),
                      content: const Text(
                        'Are you sure you do not want these product?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(
                              context,
                              listen: false,
                            ).removeCart(cartItem);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 28,
              backgroundColor: Colors.amber,
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size : ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
