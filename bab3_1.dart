import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // To keep track of the currently selected index

  // Function to handle item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black45),
          onPressed: () {},
        ),
        title: Text(
          'TOKO KECANTIKAN',
          style: TextStyle(color: Colors.black45),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.black45),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.black45),
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),

              // Banner Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Today's Deal",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w300)),
                          Text("50% OFF",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                              "For You Somethinc Lovers: Local Skincare "
                              "and Makeup Package Promo is Awaiting You!!.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("BUY IT NOW"),
                                SizedBox(width: 20),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/model_vidi.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(title: "PRODUK TERFAVORIT"),
                    SizedBox(width: 16),
                    SizedBox(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(4, (index) {
                          List<String> imagesPaths = [
                            'assets/images/cushion_sm.jpg',
                            'assets/images/lip_tint.jpg',
                            'assets/images/lip.jpg',
                            'assets/images/skintint.jpg',
                          ];
                          List<String> productDescriptions = [
                            'HOOMAN Cushion',
                            'OMBRELA Lip Totem Tint',
                            'Lip CheckMate',
                            'Copy Paste SkinTin',
                          ];
                          List<double> ratings = [4.5, 4.3, 3.9, 3.9];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage(imagesPaths[index]),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    SizedBox(width: 4),
                                    Text('${ratings[index]}',
                                        style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  productDescriptions[index],
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 6),
                  ],
                ),
              ),

              SectionHeader(title: "PRODUK TERLARIS"),
              Column(
                children: List.generate(3, (index) {
                  List<String> imagePaths = [
                    'assets/images/cushion_sm.jpg',
                    'assets/images/lip_tint.jpg',
                    'assets/images/setting_spray.jpg',
                  ];

                  List<String> descriptions = [
                    "Deskripsi Layanan 1: Penjelasan singkat tentang layanan 1.",
                    "Deskripsi Layanan 2: Penjelasan singkat tentang layanan 2.",
                    "Deskripsi Layanan 3: Penjelasan singkat tentang layanan 3.",
                  ];

                  List<double> ratings = [4.5, 3.5, 3.8];

                  return Container(
                    margin: EdgeInsets.only(
                        bottom: 20), // Tambahkan margin antar layanan
                    child: Row(
                      children: [
                        // Gambar Layanan
                        Container(
                          width: 100, // Atur lebar gambar
                          height: 100, // Atur tinggi gambar
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePaths[index]),
                              fit: BoxFit
                                  .cover, // Atur agar gambar tidak menutupi seluruhnya
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                            width:
                                30), // Jarak antara gambar dan detail layanan
                        // Detail Layanan
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Layanan ${index + 1}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  descriptions[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      '${ratings[index]}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment
                                      .centerRight, // Mengatur tombol ke kanan
                                  child: ElevatedButton(
                                    onPressed: () {
                                      print("Booking Layanan ${index + 1}...");
                                    },
                                    child: Text("Buy Now"),
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Colors.deepPurple, // Warna tombol
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              // Promo Iklan
              // Promo Iklan
              // Promo Iklan
              Container(
                margin: EdgeInsets.symmetric(vertical: 32),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Flash Sale!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Hurry! Get 50% OFF on selected items before it's too late.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            child: Text("Buy Now"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20), // Jarak antara teks dan gambar
                    Image.asset(
                      'assets/images/nct.png', // Ganti dengan path gambar yang sesuai
                      width: 160, // Atur lebar gambar sesuai kebutuhan
                      height: 80, // Atur tinggi gambar sesuai kebutuhan
                      fit: BoxFit.cover, // Atur agar gambar tidak terdistorsi
                    ),
                  ],
                ),
              ),
              // Header Recommended
              SectionHeader(title: "Recommended"), // Header

// Daftar Produk yang Direkomendasikan
              Column(
                children: List.generate(4, (index) {
                  List<String> imagePaths = [
                    'assets/images/setting_spray.jpg', // Ganti dengan path gambar yang sesuai
                    'assets/images/lip.jpg',
                    'assets/images/skintint.jpg',
                    'assets/images/highlighter.jpg',
                  ];

                  List<String> productNames = [
                    "Product 1",
                    "Product 2",
                    "Product 3",
                    "Product 4",
                  ];

                  List<String> productDescriptions = [
                    "Deskripsi untuk Produk 1.",
                    "Deskripsi untuk Produk 2.",
                    "Deskripsi untuk Produk 3.",
                    "Deskripsi untuk Produk 4.",
                  ];

                  List<double> ratings = [4.5, 4.0, 4.8, 4.2];

                  return Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10), // Jarak antar kotak
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Gambar Produk
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(imagePaths[index]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          SizedBox(
                              width:
                                  16), // Jarak antara gambar dan detail produk
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Rating
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    SizedBox(width: 4),
                                    Text('${ratings[index]}',
                                        style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                                SizedBox(height: 8),
                                // Nama Produk
                                Text(
                                  productNames[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 4),
                                // Deskripsi Produk
                                Text(
                                  productDescriptions[index],
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                SizedBox(height: 10),
                                // Tombol Beli
                                ElevatedButton(
                                  onPressed: () {
                                    print("Beli ${productNames[index]}...");
                                  },
                                  child: Text("Buy Now"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
// Header Recommended

              SizedBox(height: 10), // Recommended Workshops
              SectionHeader(title: "Produk Yang Sangat Direkomen"),
              Column(
                children: List.generate(3, (index) {
                  List<String> imagePaths = [
                    'assets/images/lip.jpg',
                    'assets/images/lip_tint.jpg',
                    'assets/images/skintint.jpg',
                  ];

                  return ServiceCard(
                    title: "PRODUK ${index + 1}",
                    price: "\$${(index + 1) * 15}",
                    imagePath: imagePaths[index],
                    description:
                        "Ini adalah deskripsi singkat pproduk ${index + 1}.",
                    rating: 4.0,
                    reviewCount: 20,
                    onBookNow: () {
                      print("Beli Produk ${index + 1}...");
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Blog'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
        currentIndex: _selectedIndex, // Set the current index
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped, // Handle taps
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: Text("See all"),
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final String description;
  final double rating;
  final int reviewCount;
  final VoidCallback onBookNow;

  ServiceCard({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description,
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 4),
            Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text('$rating', style: TextStyle(fontSize: 14)),
                SizedBox(width: 4),
                Text('($reviewCount reviews)',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: onBookNow,
          child: Text("Book Now"),
        ),
      ),
    );
  }
}
