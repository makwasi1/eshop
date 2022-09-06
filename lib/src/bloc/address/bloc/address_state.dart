part of 'address_bloc.dart';

abstract class AddressState extends Equatable {
  const AddressState();
  
  @override
  List<Object> get props => [];
}


class AddressLoadingState extends AddressState {}
class AddressAddedState extends AddressState {}

class AddressLoadedState extends AddressState {
  final List<Address> addresses;
  const AddressLoadedState({this.addresses});
  @override
  List<Object> get props => [addresses];
}


class AddressAddedFailure extends AddressState {
  final String error;
  const AddressAddedFailure({@required this.error});
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