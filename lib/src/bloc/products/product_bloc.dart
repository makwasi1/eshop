import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshop/src/models/cart_model.dart';
import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/services/products_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  ProductBloc(this._productRepository, {ProductRepository productRepository}) : super(ProductLoading()) {
    on<ProductsFetchedEvent>((event, emit) async{
     emit(ProductLoading());
      try{
          //also get cart items here
          final  product =  await _productRepository.downloadProducts();
          emit(ProductsLoadedState(product));

      } catch(e){
        emit(ProductFailure('Error downloading products!'));
      }
    });
  }

}
