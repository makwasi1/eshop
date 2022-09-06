import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshop/src/models/address_model.dart';
import 'package:eshop/src/services/address_rep.dart';
import 'package:flutter/material.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository addressRepository;
  AddressBloc({this.addressRepository}) : super(AddressLoadingState()) {
    on<AddressAddEvent>(_onAddressAdded);
    on<AddressUpdateEvent>(_onAddressUpdated);
    on<AddressEvent>(_onAddressGetById);
    on<AddressStartedEvent>(_onAddressStarted);
  }

  Future<void> _onAddressStarted(
      AddressStartedEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoadingState());
    try {
      final addresses = await addressRepository.getAddresses();
      if (addresses != null) {
        emit(AddressLoadedState(addresses: addresses));
      } else {
        emit(const AddressAddedFailure(error: 'Failed to load addresses'));
      }
      // emit(CartLoadedState(cart: cart));
    } catch (_) {
      emit(const AddressAddedFailure(error: 'Error Loading Addresses'));
    }
  }


  Future<void> _onAddressAdded(AddressAddEvent event, 
  Emitter<AddressState> emit) async {
    emit(AddressLoadingState());
      try {
         addressRepository.addAddress(event.address, event.city, event.state, event.country, event.postcode, event.phone);
          emit(AddressAddedState());
        // emit(CartLoadedState(cart: cart));
      } catch (_) {
        emit(const AddressAddedFailure(error: 'Error Adding Address'));
      }
  }

  FutureOr<void> _onAddressUpdated(AddressUpdateEvent event, Emitter<AddressState> emit) {
  }

  FutureOr<void> _onAddressGetById(AddressEvent event, Emitter<AddressState> emit) {
  }
}
