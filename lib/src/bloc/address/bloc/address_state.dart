part of 'address_bloc.dart';

abstract class AddressState extends Equatable {
  const AddressState();
  
  @override
  List<Object> get props => [];
}


class AddressLoadingState extends AddressState {}
class AddressAddedState extends AddressState {}

class AddressLoadedState extends AddressState {
  List<Address> addresses;
  
  List<WishlistItem> wishItem;
   AddressLoadedState(this.addresses, this.wishItem);
  @override
  List<Object> get props => [addresses, wishItem];
}

class AddWishLIstItemState extends AddressState {
  final WishlistModel wishItem;
  const AddWishLIstItemState({this.wishItem});
  @override
  List<Object> get props => [wishItem];
}


class AddressAddedFailure extends AddressState {
  final String error;
  const AddressAddedFailure({@required this.error});
  @override
  List<Object> get props => [error];
}

class WishListAddedFailure extends AddressState {
  final String error;
  const WishListAddedFailure({@required this.error});
  @override
  List<Object> get props => [error];
}

class AddressDeletedState extends AddressState {}

class AddressUpdatedState extends AddressState {
  final Address address;
  const AddressUpdatedState({@required this.address});
  @override
  List<Object> get props => [address];
}
