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
