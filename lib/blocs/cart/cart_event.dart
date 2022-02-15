import 'package:equatable/equatable.dart';
import 'package:new_ecommerce/models/models.dart';

abstract class CartEven extends Equatable{
  const CartEven();
  @override
  List<Object> get props => [];

}

class LoadCart extends CartEven {
  @override
  List<Object> get props => [];
}

class AddProduct extends CartEven {
  final Product product;
  const AddProduct(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveProduct extends CartEven {
  final Product product;
  const RemoveProduct(this.product);
  @override
  List<Object> get props => [product];
}