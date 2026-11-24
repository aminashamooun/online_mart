
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {

  final String productName;
  final num price;
  final num oldPrice;
  final String imagePath;

  const ProductDetailsPage({
    super.key,
    required this.productName,
    required this.price,
    required this.oldPrice,
    required this.imagePath,
  });

  @override
  State<ProductDetailsPage> createState() =>
      _ProductDetailsPageState();
}

class _ProductDetailsPageState
    extends State<ProductDetailsPage> {

  int quantity = 1;
  String selectedSize = "M";
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final isLandscape = width > height;

    final discount = widget.oldPrice > 0
        ? ((widget.oldPrice - widget.price) /
        widget.oldPrice *
        100)
        .round()
        : 0;

    return Scaffold(
      backgroundColor: Color(0xffFCEAF5),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width * 0.04),

            child: Container(
              padding: EdgeInsets.only(bottom: height * 0.025),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),

                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),

                         Text(
                          "Product Details",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },

                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.pink
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: isLandscape
                        ? height * 0.65
                        : height * 0.42,

                    width: double.infinity,

                    margin: EdgeInsets.symmetric(
                      horizontal: width * 0.035,
                    ),

                    decoration: BoxDecoration(
                      color: Color(0xffF4EAF4),
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),

                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.contain,

                        errorBuilder: (context, error, stackTrace) {
                          return  Center(
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.pink,
                              size: 70,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.025),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                    ),

                    child: Text(
                      widget.productName,
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.bold,
                        color:  Color(0xff17132D),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.012),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                    ),

                    child: Row(
                      children: [

                        Text(
                          "\$${widget.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Color(0xffE90072),
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(width: width * 0.025),

                        Text(
                          "\$${widget.oldPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),

                        Spacer(),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: Color(0xffE90072),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Text(
                            "$discount% OFF",
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.018),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                    ),

                    child: Row(
                      children: [

                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 20,
                        ),

                        SizedBox(width: 5),

                        Text("4.7 (5.2k reviews)"),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.025),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                    ),

                    child:  Text(
                      "Product Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 8),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                    ),

                    child: Text(
                      "Beautiful and stylish fashion collection. "
                          "Perfect for your daily wear and special occasions. "
                          "Comfortable fabric with an elegant look.",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        height: 1.5,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.025),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                    ),

                    child:  Text(
                      "Select Size",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                 SizedBox(height: 12),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                    ),

                    child: Row(
                      children: ["S", "M", "L", "XL"].map((itemSize) {

                        bool selected = selectedSize == itemSize;

                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = itemSize;
                              });
                            },

                            child: Container(
                              height: 42,
                              margin: EdgeInsets.only(right: 8),

                              decoration: BoxDecoration(
                                color: selected
                                    ?  Color(0xffE90072)
                                    : Colors.white,

                                borderRadius: BorderRadius.circular(12),

                                border: Border.all(
                                  color: selected
                                      ?  Color(0xffE90072)
                                      : Color(0xffF0DDEA),
                                ),
                              ),

                              child: Center(
                                child: Text(
                                  itemSize,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  SizedBox(height: height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                    ),

                    child: Row(
                      children: [

                        Expanded(
                          flex: 4,

                          child: Container(
                            height: 48,

                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffF0DDEA),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),

                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,

                              children: [

                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity--;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Color(0xffE90072),
                                  ),
                                ),

                                Text(
                                  "$quantity",
                                  style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Color(0xffE90072),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(width: width * 0.03),

                        Expanded(
                          flex: 6,

                          child: SizedBox(
                            height: 48,

                            child: ElevatedButton(
                              onPressed: () {

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "$quantity ${widget.productName} "
                                          "Added to Cart!",
                                    ),
                                  ),
                                );
                              },

                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                Color(0xffE90072),
                                foregroundColor: Colors.white,
                                elevation: 0,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),

                              child:Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
