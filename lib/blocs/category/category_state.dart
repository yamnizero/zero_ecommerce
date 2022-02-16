import 'package:equatable/equatable.dart';
import 'package:new_ecommerce/models/models.dart';

abstract class CategoryState extends Equatable{
  const CategoryState();
  @override
  List<Object> get props => [];

}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded({this.categories= const <Category> []});
  @override
  List<Object> get props => [categories];
}