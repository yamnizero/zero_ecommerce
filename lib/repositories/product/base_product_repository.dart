import 'package:new_ecommerce/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}