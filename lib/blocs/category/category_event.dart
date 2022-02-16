import 'package:equatable/equatable.dart';
import 'package:new_ecommerce/models/models.dart';

abstract class CategoryEven extends Equatable {
  const CategoryEven();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEven {}

class UpdateCategories extends CategoryEven {
  final List<Category> categories;

  UpdateCategories(this.categories);

  @override
  List<Object> get props => [categories];
}
