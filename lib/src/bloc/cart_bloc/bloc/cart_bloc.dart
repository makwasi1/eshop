import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshop/src/models/cart_model.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/services/cart_repo.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartBlocState> {
  final CartRepository cartRepository;
  final AuthRepository authRepository;
  CartBloc({this.authRepository, this.cartRepository})
      : super(CartLoadingState()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
    on<CartItemsCleared>(_onCartCleared);
    on<CartUpdated>(_onCartUpdated);
  }

  Future<void> _onStarted(
      CartStarted event, Emitter<CartBlocState> emit) async {
    emit(CartLoadingState());
    try {
      // final token = await authRepository.getCurrentUserToken();
      // if (token != null) {
      //   final cart = await cartRepository.getCartDetails();
      //   if (cart != null) {
      //     emit(CartLoadedState(cart: cart));
      //   } else {
      //     emit(CartEmptyState());
      //   }
      // } else {
        final cart = await cartRepository.getCartDetails();
        if (cart != null) {
          emit(CartLoadedState(cart: cart));
        } else {
          emit(CartEmptyState());
        }
      // }

      // emit(CartLoadedState(cart: cart));
    } catch (_) {
      emit(const CartLoadError(message: 'Error Loading Cart Items'));
    }
  }

  Future<void> _onItemAdded(
      CartItemAdded event, Emitter<CartBlocState> emit) async {
    final state = this.state;
    if (state is CartLoadedState || state is CartEmptyState) {
      final String currentUserToken =
          await AuthRepository().getCurrentUserToken();
      //update the quantity

      if (currentUserToken == null) {
        try {
          final cartItems = await cartRepository.addToCart(event.itemId, 1);
          emit(CartLoadedState(cart: cartItems));
        } on Exception catch (_) {
          emit(const CartLoadError(message: 'Failed To add To Cart'));
        }
      } else {
        try {
          final cartItems = await cartRepository.addToCart(event.itemId, 1);
          emit(CartLoadedState(cart: cartItems));
        } on Exception catch (_) {
          emit(const CartLoadError(message: 'Failed To add To Cart'));
        }
      }
    }
  }

  Future<void> _onItemRemoved(
      CartItemRemoved event, Emitter<CartBlocState> emit) async {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        Cart cartItems = await cartRepository.removeCartItem(event.item);
        emit(CartLoadedState(cart: cartItems));
        // if (cartItems != null) {
        //   emit(CartLoadedState(cart: cartItems));
        // } else {
        //   emit(CartEmptyState());
        // }
        // emit(CartLoadedState(cart: cartItems));
      } catch (_) {
        emit(const CartLoadError(message: 'Failed To Remove Cart Item'));
      }
    }
  }

  FutureOr<void> _onCartCleared(event, Emitter<CartBlocState> emit) {}

  Future<void> _onCartUpdated(
      CartUpdated event, Emitter<CartBlocState> emit) async {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        Cart cartItems =
            await cartRepository.updateCart(event.cartItemId, event.qty);
        if (cartItems != null) {
          emit(CartLoadedState(cart: cartItems));
        } else {
          emit(CartEmptyState());
        }
        // emit(CartLoadedState(cart: cartItems));
      } catch (_) {
        emit(const CartLoadError(message: 'Failed To Update Cart Item'));
      }
    }
  }
}
