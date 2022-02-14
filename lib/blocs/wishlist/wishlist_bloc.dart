import 'package:bloc/bloc.dart';
import 'package:new_ecommerce/blocs/wishlist/wishlist_event.dart';
import 'package:new_ecommerce/blocs/wishlist/wishlist_state.dart';
import 'package:new_ecommerce/models/wishlist_model.dart';

class WishlistBloc extends Bloc<WishlistEvent,WishlistState> {
  WishlistBloc(): super(WishlistLoading()){
    on<LoadWishlist>(_onLoadWishlist);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductFromWishlist);
  }
  void _onLoadWishlist(event,Emitter<WishlistState> emit) async
  {
    emit(WishlistLoaded());
    try{
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(WishlistLoaded());
    }catch(_){
      emit(WishlistError());
    }

  }


  void _onAddProductToWishlist(event,Emitter<WishlistState> emit){
    final state = this.state;
    if(state is WishlistLoaded)
    {
      try {
        emit(WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product)
          )
        ),);
      }on Exception
      {
        emit(WishlistError());
      }
    }
  }
  void _onRemoveProductFromWishlist(event,Emitter<WishlistState> emit){
    final state = this.state;
    if(state is WishlistLoaded)
    {
      try {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)..remove(event.product)
            )
        ),);
      }on Exception
      {
        emit(WishlistError());
      }
    }
  }


  }
