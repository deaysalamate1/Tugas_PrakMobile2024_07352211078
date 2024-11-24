import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      "id": 1,
      "name": "Skintint CopyPaste Somethinc",
      "image": "assets/images/skintint.jpg", // Path ke gambar lokal
      "price": 50.0,
      "quantity": 1,
    },
    {
      "id": 2,
      "name": "Oombrela Tint",
      "image": "assets/images/lip_tint.jpg", // Path ke gambar lokal
      "price": 30.0,
      "quantity": 1,
    },
    {
      "id": 3,
      "name": "LIP CHECKMATE SOMETHINC",
      "image": "assets/images/lip.jpg", // Path ke gambar lokal
      "price": 20.0,
      "quantity": 1,
    },
    {
      "id": 4,
      "name": "Setting Spray",
      "image": "assets/images/setting_spray.jpg", // Path ke gambar lokal
      "price": 40.0,
      "quantity": 1,
    },
  ];

  final double _discount = 4.0; // Diskon dalam persen
  final double _deliveryCharge = 5.0; // Biaya pengiriman

  void _updateQuantity(int index, int change) {
    setState(() {
      _cartItems[index]['quantity'] += change;
      if (_cartItems[index]['quantity'] < 1) {
        _cartItems[index]['quantity'] = 0;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  double _calculateSubtotal() {
    return _cartItems.fold(
        0.0, (sum, item) => sum + item['price'] * item['quantity']);
  }

  double _calculateDiscount(double subtotal) {
    return subtotal * (_discount / 100);
  }

  double _calculateTotal() {
    final subtotal = _calculateSubtotal();
    final discount = _calculateDiscount(subtotal);
    return subtotal - discount + _deliveryCharge;
  }

  @override
  Widget build(BuildContext context) {
    final subtotal = _calculateSubtotal();
    final discount = _calculateDiscount(subtotal);
    final total = _calculateTotal();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Daftar Produk
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: SizedBox(
                      width: 40,
                      height: 80,
                      child: Image.asset(item['image'],
                          width: 10,
                          height: 10, // Menggunakan gambar lokal
                          fit: BoxFit.cover),
                    ),
                    title: Text(item['name']),
                    subtitle: Text("\$${item['price']}"),
                    trailing: SizedBox(
                      width: 180,
                      height: 200,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => _updateQuantity(index, -1),
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor:
                                const Color.fromARGB(255, 181, 164, 186),
                            child: Text(
                              "${item['quantity']}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 226, 224, 224)),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _updateQuantity(index, 1),
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                          Align(
                            alignment:
                                Alignment.bottomCenter, // Posisi di kanan atas
                            child: IconButton(
                              onPressed: () => _removeItem(index),
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Order Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 189, 160, 204),
              border: Border(
                  top: BorderSide(
                      color: const Color.fromARGB(255, 194, 179, 197))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSummaryRow("Items", "${_cartItems.length}"),
                _buildSummaryRow(
                    "Subtotal", "\$${subtotal.toStringAsFixed(2)}"),
                _buildSummaryRow("Discount (${_discount.toInt()}%)",
                    "-\$${discount.toStringAsFixed(2)}"),
                _buildSummaryRow("Delivery Charges",
                    "\$${_deliveryCharge.toStringAsFixed(2)}"),
                const Divider(thickness: 1.5),
                _buildSummaryRow("Total", "\$${total.toStringAsFixed(2)}",
                    isBold: true),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Logika checkout di sini
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Checkout berhasil!")),
                    );
                  },
                  child: const Text("Check Out"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
