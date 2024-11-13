import 'dart:async';

// Enum Role untuk mendefinisikan peran pengguna
enum Role { Admin, Customer }

// Kelas Product
class Product {
  String productName;
  double price;
  bool inStock;

  Product(
      {required this.productName, required this.price, this.inStock = true});
}

// Kelas User sebagai superclass
class User {
  String name;
  int age;
  late Map<String, Product> products; // Menggunakan late Map untuk produk
  Role? role;

  User(this.name, this.age, {this.role}) {
    products = {}; // Inisialisasi produk sebagai Map kosong
  }
}

// Kelas AdminUser yang dapat menambah dan menghapus produk
class AdminUser extends User {
  Set<String> productNames = {}; // Set untuk memastikan keunikan produk

  AdminUser(String name, int age) : super(name, age, role: Role.Admin);

  // Fungsi untuk menambah produk ke daftar produk
  void addProduct(Product product) {
    try {
      if (!product.inStock) {
        throw Exception('Produk tidak tersedia dalam stok');
      }
      if (productNames.contains(product.productName)) {
        print('Produk "${product.productName}" sudah ada dalam daftar');
      } else {
        products[product.productName] =
            product; // Menyimpan produk dengan nama sebagai kunci
        productNames.add(product.productName); // Menambahkan nama produk ke Set
        print('Produk "${product.productName}" berhasil ditambahkan');
      }
    } on Exception catch (e) {
      print('Error: $e');
    }
  }

  // Fungsi untuk menghapus produk dari daftar produk
  void removeProduct(String productName) {
    if (products.remove(productName) != null) {
      productNames.remove(productName); // Menghapus nama produk dari Set
      print('Produk "$productName" berhasil dihapus');
    } else {
      print('Produk "$productName" tidak ditemukan dalam daftar');
    }
  }
}

// Kelas CustomerUser yang hanya bisa melihat daftar produk
class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age, role: Role.Customer);

  // Fungsi untuk menampilkan daftar produk
  void viewProducts() {
    if (products.isEmpty) {
      print('Tidak ada produk untuk ditampilkan');
    } else {
      products.forEach((name, product) {
        print('Produk: ${product.productName}, Harga: ${product.price}');
      });
    }
  }
}

// Fungsi asinkron untuk mengambil detail produk
Future<Product> fetchProductDetails(String productName, double price) async {
  await Future.delayed(
      Duration(seconds: 2)); // Simulasi pengambilan data dari server
  return Product(productName: productName, price: price, inStock: true);
}

void main() async {
  // Membuat objek produk
  var product1 = await fetchProductDetails('Laptop', 1000.0);
  var product2 = await fetchProductDetails('Smartphone', 700.0);
  var product3 = Product(productName: 'Tablet', price: 500.0, inStock: false);

  // Membuat objek AdminUser dan CustomerUser
  var admin = AdminUser('Alice', 30);
  var customer = CustomerUser('Bob', 25);

  // Menambahkan produk menggunakan AdminUser
  admin.addProduct(product1); // Berhasil
  admin.addProduct(product2); // Berhasil
  admin.addProduct(product3); // Gagal karena tidak tersedia dalam stok
  admin.addProduct(product1); // Tidak ditambahkan, produk sudah ada

  // Menampilkan daftar produk yang dimiliki AdminUser
  print('\nDaftar produk yang dimiliki oleh Admin:');
  admin.products
      .forEach((name, product) => print('Admin memiliki produk: $name'));

  // CustomerUser hanya dapat melihat daftar produk
  customer.products = admin.products;
  print('\nDaftar produk yang dapat dilihat oleh Customer:');
  customer.viewProducts();
}
