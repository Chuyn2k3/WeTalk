import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                ProductInfoPage(productName: ' 1'),
                ProductInfoPage(productName: ' 2'),
                ProductInfoPage(productName: ' 3'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage > 0)
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              if (_currentPage < 2)
                FloatingActionButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Icon(Icons.arrow_forward),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductInfoPage extends StatelessWidget {
  final String productName;

  ProductInfoPage({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Con chó $productName',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 180, 178, 178),
              borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(height: 20),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 180, 178, 178),
              borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
