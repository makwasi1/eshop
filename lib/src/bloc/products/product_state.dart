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
  ProductModel product;

  ProductsLoadedState(this.product);

  @override
  // TODO: implement props
  List<Object> get props => [product];
}

class ProductFailure extends ProductState {
  final String message;

   ProductFailure(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
  
}
