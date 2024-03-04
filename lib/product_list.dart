import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Addidas',
    'Puma',
    'Nike'
  ];
  late String filterSelected;
  @override
  void initState() {
    filterSelected = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black26,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        filterSelected = filter;
                      });
                    },
                    child: Chip(
                      label: Text(filter),
                      labelStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: filterSelected == filter ? FontWeight.bold : FontWeight.normal,
                      ),
                      backgroundColor: filterSelected == filter ? Colors.white : const Color.fromARGB(255, 194, 194, 207),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(145, 113, 113, 0.157),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              //scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ProductDetails(product: product);
                      }),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven ? Colors.blue.shade200 : const Color.fromRGBO(145, 113, 113, 0.157),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
