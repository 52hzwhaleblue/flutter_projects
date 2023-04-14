import 'package:buoi02_go_router_practice/model/Category.dart';

class Product {
  final String name;
  final String category;
  final int quantity;

  Product(this.name, this.category, this.quantity);

  static List<Product> products = [
    Product('Áo Khoác', 'Clothes', 5),
    Product('Quần Kaki', 'Pants', 10),
    Product('Quần A', 'Pants', 10),
    Product('Milk', 'Pants', 15),
    Product('Milk', 'Pants', 20),
    Product('Milk', 'Pants', 6),
    Product('Milk', 'Pants', 11),
    Product('Milk', 'Pants', 12),
    Product('Milk', 'Pants', 33),
    Product('Milk', 'Pants', 55),
  ];
}
