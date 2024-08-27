// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:library_flutter/features/auth/presentation/screens/login_screen.dart'
    as _i4;
import 'package:library_flutter/features/home/presentation/home_screen.dart'
    as _i3;
import 'package:library_flutter/features/main/data/models/book.dart' as _i13;
import 'package:library_flutter/features/main/data/models/reservation.dart'
    as _i16;
import 'package:library_flutter/features/main/presentation/screens/book_screen.dart'
    as _i1;
import 'package:library_flutter/features/main/presentation/screens/feedback_screen.dart'
    as _i2;
import 'package:library_flutter/features/main/presentation/screens/main_screen.dart'
    as _i5;
import 'package:library_flutter/features/profile/data/models/offer.dart'
    as _i14;
import 'package:library_flutter/features/profile/data/models/ownership.dart'
    as _i15;
import 'package:library_flutter/features/profile/presentation/screens/offers_screen.dart'
    as _i6;
import 'package:library_flutter/features/profile/presentation/screens/ownerships_screen.dart'
    as _i7;
import 'package:library_flutter/features/profile/presentation/screens/profile_screen.dart'
    as _i8;
import 'package:library_flutter/features/profile/presentation/screens/reservations_screen.dart'
    as _i9;
import 'package:library_flutter/features/search/presentation/screens/search_screen.dart'
    as _i10;

/// generated route for
/// [_i1.BookScreen]
class BookRoute extends _i11.PageRouteInfo<BookRouteArgs> {
  BookRoute({
    _i12.Key? key,
    required _i13.Book book,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          BookRoute.name,
          args: BookRouteArgs(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'BookRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookRouteArgs>();
      return _i1.BookScreen(
        key: args.key,
        book: args.book,
      );
    },
  );
}

class BookRouteArgs {
  const BookRouteArgs({
    this.key,
    required this.book,
  });

  final _i12.Key? key;

  final _i13.Book book;

  @override
  String toString() {
    return 'BookRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [_i2.FeedbackScreen]
class FeedbackRoute extends _i11.PageRouteInfo<FeedbackRouteArgs> {
  FeedbackRoute({
    _i12.Key? key,
    required _i13.Book book,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          FeedbackRoute.name,
          args: FeedbackRouteArgs(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'FeedbackRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FeedbackRouteArgs>();
      return _i2.FeedbackScreen(
        key: args.key,
        book: args.book,
      );
    },
  );
}

class FeedbackRouteArgs {
  const FeedbackRouteArgs({
    this.key,
    required this.book,
  });

  final _i12.Key? key;

  final _i13.Book book;

  @override
  String toString() {
    return 'FeedbackRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainScreen();
    },
  );
}

/// generated route for
/// [_i6.OffersScreen]
class OffersRoute extends _i11.PageRouteInfo<OffersRouteArgs> {
  OffersRoute({
    _i12.Key? key,
    required List<_i14.Offer> offers,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          OffersRoute.name,
          args: OffersRouteArgs(
            key: key,
            offers: offers,
          ),
          initialChildren: children,
        );

  static const String name = 'OffersRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OffersRouteArgs>();
      return _i6.OffersScreen(
        key: args.key,
        offers: args.offers,
      );
    },
  );
}

class OffersRouteArgs {
  const OffersRouteArgs({
    this.key,
    required this.offers,
  });

  final _i12.Key? key;

  final List<_i14.Offer> offers;

  @override
  String toString() {
    return 'OffersRouteArgs{key: $key, offers: $offers}';
  }
}

/// generated route for
/// [_i7.OwnershipsScreen]
class OwnershipsRoute extends _i11.PageRouteInfo<OwnershipsRouteArgs> {
  OwnershipsRoute({
    _i12.Key? key,
    required List<_i15.Ownership> ownerships,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          OwnershipsRoute.name,
          args: OwnershipsRouteArgs(
            key: key,
            ownerships: ownerships,
          ),
          initialChildren: children,
        );

  static const String name = 'OwnershipsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OwnershipsRouteArgs>();
      return _i7.OwnershipsScreen(
        key: args.key,
        ownerships: args.ownerships,
      );
    },
  );
}

class OwnershipsRouteArgs {
  const OwnershipsRouteArgs({
    this.key,
    required this.ownerships,
  });

  final _i12.Key? key;

  final List<_i15.Ownership> ownerships;

  @override
  String toString() {
    return 'OwnershipsRouteArgs{key: $key, ownerships: $ownerships}';
  }
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i9.ReservationsScreen]
class ReservationsRoute extends _i11.PageRouteInfo<ReservationsRouteArgs> {
  ReservationsRoute({
    _i12.Key? key,
    required List<_i16.Reservation> reservations,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ReservationsRoute.name,
          args: ReservationsRouteArgs(
            key: key,
            reservations: reservations,
          ),
          initialChildren: children,
        );

  static const String name = 'ReservationsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReservationsRouteArgs>();
      return _i9.ReservationsScreen(
        key: args.key,
        reservations: args.reservations,
      );
    },
  );
}

class ReservationsRouteArgs {
  const ReservationsRouteArgs({
    this.key,
    required this.reservations,
  });

  final _i12.Key? key;

  final List<_i16.Reservation> reservations;

  @override
  String toString() {
    return 'ReservationsRouteArgs{key: $key, reservations: $reservations}';
  }
}

/// generated route for
/// [_i10.SearchScreen]
class SearchRoute extends _i11.PageRouteInfo<void> {
  const SearchRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SearchScreen();
    },
  );
}
