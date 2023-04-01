import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedItem = 'All Products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 15.0),
                child: Stack(children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.transparent),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF116D51)),
                      child: const Center(
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                          size: 20,
                        ),
                      )),
                  Positioned(
                    top: 25,
                    right: 30,
                    child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: Center(
                          child: Text('9',
                              style: GoogleFonts.raleway(color: Colors.white)),
                        )),
                  ),
                ]),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Starbucks Coffe',
              style: GoogleFonts.raleway(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildItem('All products', 59),
                  _buildItem('Espresso', 17),
                  _buildItem('Iced Tea', 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 320,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCoffeeItem('assets/coffee.jpg', 'Latte with Turmeric',
                      'Iced Coffee', '2.99'),
                  _buildCoffeeItem('assets/coffee2.jpg', 'Latte with Turmeric',
                      'Iced Coffee', '2.99'),
                  _buildCoffeeItem('assets/coffee3.jpg', 'Latte with Turmeric',
                      'Iced Coffee', '2.99')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCoffeeItem(
      String imgPath, String productName, String productType, String price) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 225,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 4.0,
                blurRadius: 4.0,
              )
            ]),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 225,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  productName,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  productType,
                  style: GoogleFonts.raleway(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 0.4,
                    color: Colors.grey.withOpacity(0.4),
                  )),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\$$price',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 19.0),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.grey.withOpacity(0.2)),
                        child: const Center(
                          child: Icon(Icons.add, color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  _buildItem(String productName, int count) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, left: 4, bottom: 10),
      child: AnimatedContainer(
        duration: const Duration(microseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: switchHighlight(productName),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: switchShadow(productName))
            ]),
        height: 50,
        width: 125,
        child: InkWell(
          onTap: () {
            selectedProduct(productName);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  count.toString(),
                  style: GoogleFonts.raleway(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: switchHighlightColor(productName)),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  productName,
                  style: GoogleFonts.raleway(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: switchHighlightColor(productName)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectedProduct(String productName) {
    setState(() {
      selectedItem = productName;
    });
  }

  switchHighlight(String productName) {
    if (productName == selectedItem) {
      return const Color(0xFF116D51);
    } else {
      return Colors.grey.withOpacity(0.3);
    }
  }

  switchHighlightColor(String productName) {
    if (productName == selectedItem) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  switchShadow(String productName) {
    if (productName == selectedItem) {
      return const Color(0xFF116D51).withOpacity(0.4);
    } else {
      return Colors.transparent;
    }
  }
}
