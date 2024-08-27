part of 'offer_bloc.dart';

sealed class OfferState extends Equatable {
  const OfferState();
  
  @override
  List<Object> get props => [];
}

final class OfferInitial extends OfferState {}

final class OfferLoadingSuccessful extends OfferState {
  const OfferLoadingSuccessful({
    required this.offer,
  });

  final Offer offer;

  @override
  List<Object> get props => [offer];
}

final class OfferLoadingFailure extends OfferState {
  const OfferLoadingFailure({
    required this.exception,
  });

  final Object exception;

  @override
  List<Object> get props => [exception];
}
