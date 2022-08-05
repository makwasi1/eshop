part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

//class FetchProductsEvent extends ProductEvent {}

class ProductsFetchedEvent extends ProductEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ItemAddingCartEvent extends ProductEvent {
  final ProductModel product;

  const ItemAddingCartEvent({this.product});

  @override

  List<Object> get props => [product];
}

class ProductSelectedEvent extends ProductEvent {
  final int productId;

  const ProductSelectedEvent(this.productId);

  @override
  List<Object> get props => [productId];

  }

class ItemAddedToCartEvent extends ProductEvent {
  final ProductModel product;
  final List<Cart> cartData;

  const ItemAddedToCartEvent({this.product, this.cartData});

  @override

  List<Object> get props => [product,cartData];
}

