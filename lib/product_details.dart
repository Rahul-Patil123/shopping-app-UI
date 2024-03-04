import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize = 0;
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addCart({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'size': selectedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Added Successfully, ENJOY ;)'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('* Please Select any size or else you would complain !'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Image.asset(widget.product['imageUrl'] as String),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(145, 113, 113, 0.157),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                              style: TextStyle(
                                color: selectedSize == size ? Colors.black : null,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: selectedSize == size ? Colors.white : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
