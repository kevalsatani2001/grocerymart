class Product{
  final int? id;
  final String? name;
  final int? price;
  int? qty;

  Product({this.id, this.name,  this.price,this.qty=1});
}

void main() {
  Product p= Product();
} 