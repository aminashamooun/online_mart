
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List<CartProduct> cartItems = [
    CartProduct(
      name: "Elegant Dress",
      price: 29.99,
      image: "assets/imagesss/model.png",
      quantity: 1,
    ),

    CartProduct(
      name: "Sport Shoes",
      price: 49.99,
      image: "assets/imagesss/zaa.png",
      quantity: 1,
    ),
  ];

  double get subtotal {
    return cartItems.fold<double>(
      0.0,
          (sum, item) => sum + (item.price * item.quantity),
    );
  }

  double get shipping {
    return cartItems.isEmpty ? 0.0 : 5.0;
  }

  double get total {
    return subtotal + shipping;
  }

  void increase(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrease(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFFF5FA),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width * 0.05),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),

                    Text(
                      "My Cart",
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: width * 0.12),
                  ],
                ),

                SizedBox(height: height * 0.02),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cartItems.length,

                  itemBuilder: (context, index) {

                    final item = cartItems[index];

                    return Container(
                      margin: EdgeInsets.only(
                        bottom: height * 0.02,
                      ),

                      padding: EdgeInsets.all(width * 0.025),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.08),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),

                            child: Image.asset(
                              item.image,
                              height: height * 0.30,
                              width: width * 0.32,
                              fit: BoxFit.contain,

                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: height * 0.17,
                                  width: width * 0.32,
                                  color: Colors.pink.shade50,

                                  child: Icon(
                                    Icons.shopping_bag,
                                    color: Colors.pink,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(width: width * 0.035),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [

                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: width * 0.038,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(height: height * 0.01),

                                Text(
                                  "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: width * 0.042,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: height * 0.012),

                                Row(
                                  children: [

                                    IconButton(
                                      onPressed: () {
                                        decrease(index);
                                      },

                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.pink,
                                      ),

                                      constraints: BoxConstraints(
                                        minWidth: 30,
                                        minHeight: 30,
                                      ),

                                      padding: EdgeInsets.zero,
                                    ),

                                    Text(
                                      "${item.quantity}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        increase(index);
                                      },

                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.pink,
                                      ),

                                      constraints: BoxConstraints(
                                        minWidth: 30,
                                        minHeight: 30,
                                      ),

                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                if (cartItems.isEmpty)
                  Padding(
                    padding: EdgeInsets.all(height * 0.05),

                    child: Column(
                      children: [

                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 65,
                          color: Colors.pink,
                        ),

                        SizedBox(height: 10),

                        Text(
                          "Your Cart is Empty",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Subtotal"),

                    Text(
                      "\$${subtotal.toStringAsFixed(2)}",
                    ),
                  ],
                ),

                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Shipping"),

                    Text(
                      "\$${shipping.toStringAsFixed(2)}",
                    ),
                  ],
                ),

                SizedBox(height: height * 0.015),

                Divider(color: Colors.pink),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      "Total",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),

                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.035),
                SizedBox(
                  width: double.infinity,
                  height: height * 0.065,

                  child: ElevatedButton(
                    onPressed: () {

                      if (cartItems.isEmpty) {

                        ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                            content: Text("Your Cart is Empty!"),
                          ),
                        );

                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Checkout Total: \$${total.toStringAsFixed(2)}",
                            ),
                          ),
                        );
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    child: Text(
                      "Proceed to Checkout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CartProduct {

  String name;
  double price;
  String image;
  int quantity;

  CartProduct({
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
  });
}
