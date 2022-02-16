import 'package:new_ecommerce/models/models.dart';

abstract class BaseCategoryRepository{
  Stream<List<Category>> getAllCategories();

}