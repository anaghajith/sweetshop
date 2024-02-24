import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sweetshop/screens/homescreen/special_offers.dart';
import 'package:sweetshop/screens/product_details.dart';
import 'package:sweetshop/screens/homescreen/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchText = '';
  String _selectedCategory = 'All';
  double _minPrice = 0;
  double _maxPrice = 20; // Set initial max price

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sweet Shop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to shopping cart
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildShopOverview(),
            SizedBox(height: 20),
            _buildSearchBar(),
            SizedBox(height: 10),
            _buildSpecialOffers(),
            SizedBox(height: 10),
            _buildFilter(),
            SizedBox(height: 10),
            _buildProductList(),
          ],
        ),
      ),
    );
  }

  Widget _buildShopOverview() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.purple[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Welcome to Our Sweet Shop!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'We offer a wide range of delicious sweets for every occasion. Visit us today to satisfy your sweet cravings!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/shop.jpg'),
                  // Replace with your shop image asset
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for sweets...',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          setState(() {
            _searchText = value;
          });
        },
      ),
    );
  }

  Widget _buildFilter() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Filter by Category:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          DropdownButton<String>(
            value: _selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                _selectedCategory = newValue!;
              });
            },
            items: <String>[
              'All',
              'Chocolates',
              'Candies',
              'Cookies',
              'Cakes',
              'Other Confectionery Items'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Text(
            'Price Range: \$${_minPrice.toStringAsFixed(2)} - \$${_maxPrice
                .toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            value: _minPrice,
            min: 0,
            max: _maxPrice,
            onChanged: (value) {
              setState(() {
                _minPrice = value;
              });
            },
            onChangeEnd: (value) {
              if (_maxPrice < value) {
                setState(() {
                  _maxPrice = value;
                });
              }
            },
            divisions: _maxPrice.toInt(),
            label: _minPrice.toStringAsFixed(2),
          ),
          Slider(
            value: _maxPrice,
            min: _minPrice,
            max: 50,
            // Set max price
            onChanged: (value) {
              setState(() {
                _maxPrice = value;
              });
            },
            divisions: _maxPrice.toInt(),
            label: _maxPrice.toStringAsFixed(2),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    // Get the filtered product list based on search text, category, and price range
    List<Product> filteredProducts = _getFilteredProducts();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              ProductScreen(product: filteredProducts[index]))
                      );
                    },
                    child: _buildProductItem(filteredProducts[index])
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Product> _getFilteredProducts() {
    // Assuming productList is a list of Product objects
    List<Product> productList = [
      Product(
        name: 'Dark Chocolate Bar',
        category: 'Chocolates',
        price: 5.99,
        image: 'assets/dark_chocolate.png',
        description: 'The Pure Cacao Bar ! This intense and flavourful 100% dark chocolate bar is made using only Cacao, and has no other ingredient!',
      ),
      Product(
        name: 'Milk Chocolate Bar',
        category: 'Chocolates',
        price: 9.99,
        image: 'assets/milk_chocolate.jpg',
        description: 'The Milk Chocolate Bar is crafted using premium ingredients, including cocoa, milk solids, sugar, and other flavor-enhancing components.',
      ),
      Product(
        name: 'Gummy Bears',
        category: 'Candies',
        price: 3.99,
        image: 'assets/gummy_bears.jpg',
        description: 'These bears are a perfect dairy-free snack for people of all ages. Each bear has a jelly coating for a silky mouthfeel.',
      ),
      Product(
        name: 'Sour Candies',
        category: 'Candies',
        price: 4.99,
        image: 'assets/sour_candy.jpg',
        description: 'Look no further than Warheads Sour Candy, the ultimate sour experience that will leave your taste buds begging for more!',
      ),
      Product(
        name: 'Chocolate Chip Cookies',
        category: 'Cookies',
        price: 6.99,
        image: 'assets/chocolate_chip_cookies.jpg',
        description: 'These ultra soft and chewy chocolate chip cookies have readers raving about the recipe. And the best part is you dont even need a mixer!',
      ),
      Product(
        name: 'Oatmeal Raisin Cookies',
        category: 'Cookies',
        price: 5.99,
        image: 'assets/oatmeal_resin_cookies.jpg',
        description: 'Made with brown sugar, vanilla, cinnamon, chewy oats, sweet raisins, and a secret ingredient, this recipe wins for flavor and texture.',
      ),
      Product(
        name: 'Chocolate Cake',
        category: 'Cakes',
        price: 19.99,
        image: 'assets/chocolate_cake.jpg',
        description: 'The Most Amazing Chocolate Cake is moist, decadent, chocolatey perfection with a batter that is made in just one bowl. ',
      ),
      Product(
        name: 'Vanilla Cake',
        category: 'Cakes',
        price: 17.99,
        image: 'assets/vanilla_cake.jpg',
        description: ' This vanilla cake has the most soft, tender, melt-in-your mouth crumb and is bursting with vanilla flavour.',
      ),
      Product(
        name: 'Caramel Popcorn',
        category: 'Other Confectionery Items',
        price: 8.99,
        image: 'assets/caramel_popcorn.jpg',
        description: 'Enjoy the supermacy of caramel popping in the mouth!',
      ),
      Product(
        name: 'Cotton Candy Macrons',
        category: 'Other Confectionery Items',
        price: 3.99,
        image: 'assets/cotton_candy.jpg',
        description: 'Cotton candy macarons of your dreams! Beautifully marbled macaron shells filled with cotton candy flavored Swiss meringue buttercream.',
      ),
    ];

    // Apply filters
    final searchTextLower = _searchText.toLowerCase();
    final isAllCategory = _selectedCategory.toLowerCase() == 'all';
    final minPrice = _minPrice;
    final maxPrice = _maxPrice;

    List<Product> filteredList = productList.where((product) {
      // Filter by search text
      final productNameLower = product.name.toLowerCase();
      final categoryLower = product.category.toLowerCase();
      final containsSearchText =
          productNameLower.contains(searchTextLower) ||
              categoryLower.contains(searchTextLower);

      // Filter by category
      final matchesCategory = isAllCategory ||
          categoryLower == _selectedCategory.toLowerCase();

      // Filter by price range
      final isWithinPriceRange =
          product.price >= minPrice && product.price <= maxPrice;

      return containsSearchText && matchesCategory && isWithinPriceRange;
    }).toList();

    return filteredList;
  }

  Widget _buildProductItem(Product product) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${product.category} - \$${product.price.toStringAsFixed(2)}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialOffers() {
    List<Map<String, String>> offers = [
      {
        'title': '50% Off Chocolate Bars',
        'description': 'Limited time offer on all chocolate bars!',
        'image': 'assets/chocolate_bar_offer.png',
      },
      {
        'title': 'Buy 2 Get 1 Free on Candies',
        'description': 'Purchase any 2 packs of candies and get 1 pack free!',
        'image': 'assets/candy_assortment.png',
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Special Offers and Promotions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          CarouselSlider.builder(
            itemCount: offers.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return SpecialOfferItem(
                title: offers[index]['title']!,
                description: offers[index]['description']!,
                image: offers[index]['image']!,
              );
            },
            options: CarouselOptions(
              height: 160,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              pauseAutoPlayOnTouch: true,
              onPageChanged: (index, reason) {},
            ),
          ),
        ],
      ),
    );
  }
}