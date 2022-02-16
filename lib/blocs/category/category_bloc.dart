import 'package:bloc/bloc.dart';
import 'package:new_ecommerce/blocs/category/category_event.dart';
import 'package:new_ecommerce/blocs/category/category_state.dart';

class CategoryBloc extends Bloc<CategoryEven,CategoryState> {
  CategoryBloc() : super (CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(
      CategoryEven even,

      ) async* {

  }
}