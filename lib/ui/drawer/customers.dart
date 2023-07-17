import 'dart:developer';
import 'package:alert_system/alert_overlay_plugin.dart';
import 'package:color_system/color_system.dart';
import 'package:connecting_to_react_app/logic/model/create_costumers.dart';
import 'package:connecting_to_react_app/logic/repo/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bloc/api_bloc.dart';
import '../../logic/bloc/api_event.dart';
import '../../logic/bloc/api_state.dart';

class Customers extends StatefulWidget {
  static const routeName = '/customers';
  const Customers({
    Key? key,
  }) : super(key: key);

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  @override
  void initState() {
    _load();
    super.initState();
  }

  final f1 = TextEditingController();
  final f2 = TextEditingController();

  void _load() {
    BlocProvider.of<ApiBloc>(context).add(LoadApiEvent(
        apiRepository: RepositoryProvider.of<ApiRepository>(context)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ApiBloc, ApiState>(
        bloc: BlocProvider.of<ApiBloc>(context),
        builder: (BuildContext context, ApiState currentState) {
          log(currentState.toString(), name: 'State log');
          if (currentState is LoadingApiState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorApiState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ElevatedButton(
                    child: const Text('reload'),
                    onPressed: () => _load(),
                  ),
                ),
              ],
            ));
          }
          if (currentState is NewCustomerCreatedApiState) {
            return SizedBox(
              height: 200,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  tileColor: HexColor('#87c971'),
                  title: const CircleAvatar(
                    radius: 30,
                  ),
                  subtitle: Column(
                    children: [
                      _buildText(text: currentState.customers.person!.name),
                      _buildText(text: currentState.customers.person!.industry),
                    ],
                  ),
                ),
              ),
            );
          }
          if (currentState is FetchedApiState) {
            var data = currentState.customers.data;
            return Center(
                child: GridView.builder(
              itemCount: data!.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    tileColor: HexColor('#87c971'),
                    title: const CircleAvatar(
                      radius: 30,
                    ),
                    subtitle: Column(
                      children: [
                        _buildText(text: data[i].name!),
                        _buildText(text: data[i].industry!),
                        TextButton(
                            onPressed: () {
                              BlocProvider.of<ApiBloc>(context).add(
                                  DeleteCostumersApiEvent(
                                      apiRepository:
                                          RepositoryProvider.of<ApiRepository>(
                                              context),
                                      id: data[i].id!));
                            },
                            child: const Text('delete'))
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                crossAxisSpacing: 16.0,
              ),
            ));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          OverlayManager.show(
              child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: f1,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                TextFormField(
                  controller: f2,
                  decoration: const InputDecoration(hintText: 'Industry'),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    OverlayManager.dismissOverlay();
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<ApiBloc>(context).add(
                      CreateNewCostumersApiEvent(
                        apiRepository:
                            RepositoryProvider.of<ApiRepository>(context),
                        customersModel: CreateCustomersModel(
                            industry: f2.text, name: f1.text),
                      ),
                    );
                    OverlayManager.dismissOverlay();
                  },
                  child: const Text('Add Customer'))
            ],
          ));
        },
        label: const Text('Add Customer'),
      ),
    );
  }

  Widget _buildText({text}) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(text),
      );
}
