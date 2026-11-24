
import 'package:flutter/material.dart';
import 'package:online_mart/Product_Details_Page.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WomenPageState();
}

class _WomenPageState extends State<Wishlist> {

  String category = "All";

  List<String> categories = [
    "All",
    "Dresses",
    "Tops",
    "Jeans",
    "Kurti",
  ];

  List<Map<String, dynamic>> products = [
    {
      "name": "Elegant Dress",
      "price": 29.99,
      "old": 49.99,
      "category": "Dresses",
      "image": "assets/imagesss/eligent.png",
      "favorite": false,
    },
    {
      "name": "Stylish Kurti",
      "price": 27.99,
      "old": 44.99,
      "category": "Kurti",
      "image": "assets/imagesss/kurti.png",
      "favorite": false,
    },
    {
      "name": "Floral Dress",
      "price": 32.99,
      "old": 52.99,
      "category": "Dresses",
      "image": "assets/imagesss/flolar.png",
      "favorite": false,
    },
    {
      "name": "Party Wear",
      "price": 34.99,
      "old": 59.99,
      "category": "Kurti",
      "image": "assets/imagesss/party.png",
      "favorite": false,
    },
    {
      "name": "Tops Wear",
      "price": 34.99,
      "old": 59.99,
      "category": "Tops",
      "image": "assets/imagesss/tops.png",
      "favorite": false,
    },
    {
      "name": "Jeans Wear",
      "price": 34.99,
      "old": 59.99,
      "category": "Jeans",
      "image": "assets/imagesss/jeans.png",
      "favorite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    List<Map<String, dynamic>> showProducts =
    products.where((item) {
      return category == "All" ||
          item["category"] == category;
    }).toList();

    return Scaffold(
      backgroundColor:  Color(0xFFFFF3FA),

      body: SafeArea(
        child: SingleChildScrollView(
          physics:  BouncingScrollPhysics(),

          child: Padding(
            padding: EdgeInsets.all(width * 0.04),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:  Icon(Icons.arrow_back),
                    ),

                     Text(
                      "Women Fashion",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                   Icon(Icons.search),
                  ],
                ),

                SizedBox(height: height * 0.02),
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: categories.map((item) {

                        return Padding(
                          padding:
                          EdgeInsets.only(right: 8),

                          child: ChoiceChip(
                            label: Text(item),

                            selected: category == item,

                            selectedColor: Colors.pink,
                            backgroundColor: Colors.white,

                            labelStyle: TextStyle(
                              color: category == item
                                  ? Colors.white
                                  : Colors.black,
                            ),

                            onSelected: (value) {
                              setState(() {
                                category = item;
                              });
                            },

                            showCheckmark: false,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),
                GridView.builder(
                  shrinkWrap: true,

                  physics:
                   NeverScrollableScrollPhysics(),

                  itemCount: showProducts.length,

                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.68,
                  ),

                  itemBuilder: (context, index) {

                    var item = showProducts[index];

                    return InkWell(
                      borderRadius:
                      BorderRadius.circular(15),

                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsPage(
                                  productName: item["name"],
                                  price: item["price"],
                                  oldPrice: item["old"],
                                  imagePath: item["image"],
                                ),
                          ),
                        );
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(15),
                        ),

                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [
                            Expanded(
                              child: Stack(
                                children: [

                                  ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(12),

                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,

                                      child: Image.asset(
                                        item["image"],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 5,

                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          item["favorite"] =
                                          !item["favorite"];
                                        });
                                      },

                                      icon: Icon(
                                        item["favorite"]
                                            ? Icons.favorite
                                            : Icons.favorite_border,

                                        color: item["favorite"]
                                            ? Colors.pink
                                            : Colors.black,
                                      ),

                                      style:
                                      IconButton.styleFrom(
                                        backgroundColor:
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                               EdgeInsets.all(8),

                              child: Text(
                                item["name"],
                                maxLines: 1,
                                overflow:
                                TextOverflow.ellipsis,

                                style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                               EdgeInsets.only(
                                left: 8,
                                bottom: 10,
                                right: 5,
                              ),

                              child: Row(
                                children: [

                                  Text(
                                    "\$${item["price"]}",

                                    style:  TextStyle(
                                      color: Colors.pink,
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(width: 6),

                                  Flexible(
                                    child: Text(
                                      "\$${item["old"]}",
                                      overflow:
                                      TextOverflow.ellipsis,

                                      style: TextStyle(
                                        color: Colors.grey,
                                        decoration:
                                        TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
