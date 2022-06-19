part of 'cart_cubit.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartAdd extends CartState {}

class CartRemove extends CartState {}

class CartUpdate extends CartState {}

class InitCartState extends CartState {
  final int counter;
  const InitCartState(this.counter);

  @override
  List<Object> get props => [counter];
}
