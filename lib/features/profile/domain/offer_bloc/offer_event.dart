part of 'offer_bloc.dart';

sealed class OfferEvent extends Equatable {
  const OfferEvent();

  @override
  List<Object> get props => [];
}

final class MakeOffer extends OfferEvent {
  const MakeOffer({required this.offer});

  final String offer;

  @override
  List<Object> get props => [offer];
}
