part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartItemAdded extends CartEvent {
  const CartItemAdded(this.itemId);

  final int itemId;

  @override
  List<Object> get props => [itemId];
}

class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.item);

  final int item;

  @override
  List<Object> get props => [item];
}

class CartItemsCleared extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartUpdated extends CartEvent {
  const CartUpdated(this.cartItemId , this.qty);

  final int qty;
  final String cartItemId;

  @override
  List<Object> get props => [qty, cartItemId];
}
