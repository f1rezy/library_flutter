import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_flutter/features/profile/data/models/offer.dart';
import 'package:library_flutter/features/profile/data/repositories/offer_repository.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferBloc({required OfferRepository offerRepository})
      : _offerRepository = offerRepository,
        super(OfferInitial()) {
    on<MakeOffer>(_offer);
  }

  final OfferRepository _offerRepository;

  Future<void> _offer(event, emit) async {
    try {
      final offer = await _offerRepository.offer(event.offer);
      emit(OfferLoadingSuccessful(offer: offer));
    } catch (e) {
      emit(OfferLoadingFailure(exception: e));
    }
  }
}
