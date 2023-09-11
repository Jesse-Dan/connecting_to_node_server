// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:connecting_to_react_app/logic/model/create_costumers.dart';
import 'package:connecting_to_react_app/logic/model/customer_model.dart';
import 'package:connecting_to_react_app/logic/model/new_user.dart';
import 'package:http/http.dart' as reach;
import '../../constants/urls_and_endpoints.dart';
import '../model/update_customer_model.dart';

class ApiProvider {
  Future<CustomerDataModel?> fetchCustomers() async {
    try {
      var response = await reach.get(Uri.parse(BASE_URL + GET_ALL));
      var data = customerDataModelFromJson(response.body);
      logger(message: data.data.toString());
      logger(message: json.decode(response.body).toString());

      return data;
    } catch (e, s) {
      logger(message: e.toString(), stacktrace: s);
      return null;
    }
  }

  Future<String?> deleteCustomers({id}) async {
    try {
      var response =
          await reach.delete(Uri.parse(BASE_URL + GET_ALL + setVariable(id)));
      var data = response.body;
      logger(message: response.request!.url.toString());
      logger(message: data.toString());
      return data;
    } catch (e, s) {
      logger(message: e.toString(), stacktrace: s);
      return null;
    }
  }

  Future<NewCreatedCustomersModel?> createCustomers(
      {required CreateCustomersModel newCostumers}) async {
    try {
      var response = await reach.post(Uri.parse(BASE_URL + GET_ALL),
          body: newCostumers.toJson());
      var data = newCreatedCustomersModelFromJson(response.body);
      logger(message: data.toString());
      return data;
    } catch (e, s) {
      logger(message: e.toString(), stacktrace: s);
      return null;
    }
  }

  Future<void> updateCustomers({required UpdateCustomersModel update}) async {
    try {
      var response = await reach.put(
          Uri.parse(BASE_URL + GET_ALL + setVariable(update.id)),
          body: update.toJson());
      logger(message: response.request!.url.toString());
    } catch (e, s) {
      logger(message: e.toString(), stacktrace: s);
    }
  }

  logger({message, stacktrace}) {
    log(message, stackTrace: stacktrace, name: 'Provider log');
  }

  String setVariable(data) => (data != null ? '$data' : '');
}
