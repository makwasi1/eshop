part of 'cart_bloc.dart';

abstract class CartBlocState extends Equatable {
  const CartBlocState();

  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartBlocState {}

class CartLoadedState extends CartBlocState {
  final Cart cart;

  const CartLoadedState({this.cart});

  @override
  List<Object> get props => [cart];
}

class CartEmptyState extends CartBlocState{
  
}

class CartLoadError extends CartBlocState {
  final String message;

  const CartLoadError({this.message});

  @override
  List<Object> get props => [message];
}
