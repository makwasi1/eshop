part of 'product_bloc.dart';

abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ProductsLoadedState extends ProductState {
  List<Products> product;
  List<Categories> categories;

  ProductsLoadedState(this.product, this.categories);

  @override
  List<Object> get props => [product, categories];
}

class ProductItemState extends ProductState {
  ProductItem product;

  ProductItemState(this.product);

  @override
  List<Object> get props => [product];
}

class ProductFailure extends ProductState {
  final String message;

  ProductFailure(this.message);

  @override
  List<Object> get props => [message];
}

class ItemAddingCartState extends ProductState {
  ProductModel product;
  List<Cart> cartData;
  @override
  List<Object> get props => [];
  ItemAddingCartState({this.product, this.cartData});
}

class ItemAddedToCart extends ProductState {
  final List<ProductModel> cartItems;

  ItemAddedToCart(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class ItemRemovedFromCart extends ProductState {
  final List<ProductModel> cartItems;

  ItemRemovedFromCart(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}
