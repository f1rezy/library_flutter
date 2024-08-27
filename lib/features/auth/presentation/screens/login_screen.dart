
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_flutter/core/navigation/navigation.gr.dart';
import 'package:library_flutter/features/auth/domain/user_bloc/user_bloc.dart';
import 'package:library_flutter/features/auth/presentation/widgets/input.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserAuthentificationError) {
          toastification.show(
            title: const Text('Ошибка авторизации'),
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            alignment: Alignment.bottomCenter,
          );
        }
        if (state is UserAuthenticated) {
          toastification.show(
            title: const Text('Успешно!'),
            type: ToastificationType.success,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            alignment: Alignment.bottomCenter,
          );
          AutoRouter.of(context).replace(const HomeRoute());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(1),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Text(
                  'Привет!',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Добро пожаловать обратно, мы скучали по вам!',
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 50,
                ),
                Input(
                    controller: _usernameController,
                    obscureText: false,
                    hint: 'Имя пользователя'),
                const SizedBox(
                  height: 20,
                ),
                Input(
                    controller: _passwordController,
                    obscureText: true,
                    hint: 'Пароль'),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<UserBloc>().add(LoginUser(
                        username: _usernameController.text,
                        password: _passwordController.text));
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width - 50,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'Войти',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
