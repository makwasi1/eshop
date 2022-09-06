part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class AddressStartedEvent extends AddressEvent {
  
  @override
  List<Object> get props => [];
}

class AddressAddEvent extends AddressEvent {
  
  final String address;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final String phone;
  const AddressAddEvent({this.city, this.state, this.country, this.postcode, this.phone, this.address});
  @override
  List<Object> get props => [address,city,state,country,postcode,phone];
}

class AddressDeleteEvent extends AddressEvent {
  final String address;
  const AddressDeleteEvent(this.address);
  @override
  List<Object> get props => [address];
}

class AddressUpdateEvent extends AddressEvent {
  final String address;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final String phone;
  const AddressUpdateEvent(this.city, this.state, this.country, this.postcode, this.phone, {@required this.address});
  @override
  List<Object> get props => [address,city,state,country,postcode,phone];
}

class AddressGetByIdEvent extends AddressEvent {
  final int addressId;
  const AddressGetByIdEvent(this.addressId);
  @override
  List<Object> get props => [addressId];
}