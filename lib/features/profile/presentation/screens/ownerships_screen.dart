import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_flutter/features/profile/data/models/ownership.dart';

@RoutePage()
class OwnershipsScreen extends StatelessWidget {
  const OwnershipsScreen({super.key, required this.ownerships});

  final List<Ownership> ownerships;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
            onPressed: () {
              AutoRouter.of(context).back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'История владений',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 50),
          child: Column(
            children: ownerships
                .map((ownership) => OwnershipTile(ownership: ownership))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class OwnershipTile extends StatelessWidget {
  const OwnershipTile({
    super.key,
    required this.ownership,
  });

  final Ownership ownership;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ownership.book,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ownership.ended != null
              ? Text(
                  '${DateFormat('dd-MM-yyyy').format(ownership.started.add(const Duration(hours: 7)))} - ${DateFormat('dd-MM-yyyy').format(ownership.started.add(const Duration(hours: 7)))}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                )
              : const Text(
                  'Ещё во владении',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
        ],
      ),
    );
  }
}
