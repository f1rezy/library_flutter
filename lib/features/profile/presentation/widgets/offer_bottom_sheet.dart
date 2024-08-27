import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_flutter/features/profile/domain/offer_bloc/offer_bloc.dart';
import 'package:library_flutter/features/profile/presentation/widgets/offer_input.dart';
import 'package:toastification/toastification.dart';

class OfferBottomSheet extends StatefulWidget {
  const OfferBottomSheet({
    super.key,
  });

  @override
  State<OfferBottomSheet> createState() => _OfferBottomSheetState();
}

class _OfferBottomSheetState extends State<OfferBottomSheet> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfferBloc, OfferState>(
      listener: (context, state) {
        if (state is OfferLoadingSuccessful) {
          toastification.show(
            title: const Text('Успешно!'),
            type: ToastificationType.success,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            alignment: Alignment.topCenter,
          );
          Navigator.pop(context);
        }
        if (state is OfferLoadingFailure) {
          toastification.show(
            title: const Text('Ошибка'),
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            alignment: Alignment.topCenter,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OfferInput(
              controller: _controller,
            ),
            GestureDetector(
              onTap: () {
                context
                    .read<OfferBloc>()
                    .add(MakeOffer(offer: _controller.text));
              },
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Отправить',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
