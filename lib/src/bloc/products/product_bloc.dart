import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshop/src/models/cart_model.dart';
import 'package:eshop/src/models/categories_model.dart';
import 'package:eshop/src/models/product_item.dart';
import 'package:eshop/src/models/products_model.dart';
import 'package:eshop/src/services/cart_repo.dart';
import 'package:eshop/src/services/category_repo.dart';
import 'package:eshop/src/services/products_repo.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  CartRepository cartRepository = CartRepository();
  // final CategoryRepository _categoryRepository;
  ProductBloc({this.productRepository}) : super(ProductLoading()) {
    on<ProductsFetchedEvent>((_onProductsFetchedEvent));
    on<ItemAddingCartEvent>((_onItemAddingCartEvent));
    on<ProductSelectedEvent>((_onProductSelectedEvent));
  }

  Future<void> _onProductsFetchedEvent(
      ProductsFetchedEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      //also get cart items here
      final product = await productRepository.downloadProducts();
      final categories = await productRepository.downloadCategories();
      // final cartItem = await cartRepository.getCartDetails();
      emit(ProductsLoadedState(product.data, categories));
    } catch (e) {
      emit(ProductFailure('Error downloading products!'));
    }
  }

  Future<void> _onItemAddingCartEvent(
      ItemAddingCartEvent event, Emitter<ProductState> emit) async {
    final state = this.state;
    emit(ProductLoading());
    try {
      // final cart = await _productRepository.(event.product);
      // emit(ItemAddingCartState(product: event.product, cartData: cart));
    } catch (e) {
      emit(ProductFailure('Error adding item to cart!'));
    }
  }

  Future<void> _onProductSelectedEvent(
      ProductSelectedEvent event, Emitter<ProductState> emit) async {
    final state = this.state;
    emit(ProductLoading());
    try {
      final product = await productRepository.getProduct(event.productId);
      if (product != null) {
        emit(ProductItemState(product));
      } else {
        emit(ProductFailure('Error downloading product!'));
      }
      
    } catch (e) {
      emit(ProductFailure('Error adding item to cart!'));
    }
  }
}
