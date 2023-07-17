import 'package:alert_system/systems/initializer.dart';
import 'package:connecting_to_react_app/logic/bloc/api_bloc.dart';
import 'package:connecting_to_react_app/logic/repo/api_repository.dart';
import 'package:connecting_to_react_app/ui/drawer.dart';
import 'package:connecting_to_react_app/ui/drawer/dictionary.dart';
import 'package:connecting_to_react_app/ui/drawer/employee.dart';
import 'package:connecting_to_react_app/ui/drawer/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/bloc/api_state.dart';
import '../ui/drawer/customers.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ApiBloc(const InitializedApiState())),
        ],
        child: MultiRepositoryProvider(
            providers: [
              RepositoryProvider(
                create: (_) => ApiRepository(),
              )
            ],
            child: MaterialApp(
              builder: OverlayManagerInit.builder,
              navigatorObservers: [OverlayManagerInit.navigatorObserver],
              themeMode: ThemeMode.system,
              onGenerateRoute: (RouteSettings routeSettings) =>
                  // final args = routeSettings.arguments;
                  MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case Customers.routeName:
                      return const Customers();
                    case DrawerView.routeName:
                      return const DrawerView();
                    case Employee.routeName:
                      return const Employee();
                    case Dictionary.routeName:
                      return const Dictionary();
                    case Login.routeName:
                      return const Login();
                    default:
                      return const DrawerView();
                  }
                },
              ),
            )));
  }
}
