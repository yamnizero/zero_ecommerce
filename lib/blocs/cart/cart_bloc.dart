import 'package:bloc/bloc.dart';
import 'package:new_ecommerce/blocs/cart/cart_event.dart';
import 'package:new_ecommerce/blocs/cart/cart_state.dart';
import 'package:new_ecommerce/models/models.dart';

class CartBloc extends Bloc<CartEven,CartState>{
  CartBloc() : super(CartLoading()){
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemovedProduct);
  }

  void _onLoadCart(event,Emitter<CartState> emit) async {
    emit(CartLoading());
    try{
      await Future<void>.delayed(const Duration(seconds: 1));
      emit( const CartLoaded());
    }catch (_){
      emit(CartError());
    }
  }
  void _onAddProduct(event,Emitter<CartState> emit){
    final state  = this.state;
    if(state is CartLoaded) {
      try{
        emit(CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..add(event.product),
          ),
        ),);
      }on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemovedProduct(event,Emitter<CartState> emit){
    final state  = this.state;

    if(state is CartLoaded) {
      try{
        emit(CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..remove(event.product),
          ),
        ),);
      }on Exception {
        emit(CartError());
      }
    }
  }




}