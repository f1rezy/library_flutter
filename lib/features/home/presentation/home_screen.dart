import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:library_flutter/core/helpers/dio_helper.dart';
import 'package:library_flutter/core/navigation/navigation.gr.dart';
import 'package:library_flutter/features/auth/domain/user_bloc/user_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    GetIt.I<Dio>().interceptors.add(TokenInterceptor(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserUnauthenticated) {
          AutoRouter.of(context).replace(const LoginRoute());
        }
      },
      child: AutoTabsRouter(
        routes: const [
          MainRoute(),
          SearchRoute(),
          ProfileRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            extendBody: true,
            body: SafeArea(
              bottom: false,
              child: child,
            ),
            bottomNavigationBar: DotCurvedBottomNav(
              selectedIndex: tabsRouter.activeIndex,
              onTap: (index) => _openPage(index, tabsRouter),
              backgroundColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              items: const [
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
