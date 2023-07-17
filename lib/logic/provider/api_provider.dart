import 'dart:async';
import 'dart:developer';
import 'package:connecting_to_react_app/logic/model/create_costumers.dart';
import 'package:connecting_to_react_app/logic/model/customer_model.dart';
import 'package:connecting_to_react_app/logic/model/new_user.dart';
import 'package:http/http.dart' as http;

import '../../constants/urls_and_endpoints.dart';

class ApiProvider {
  Future<CustomerDataModel?> fetchCustomers() async {
    try {
      var response = await http.get(Uri.parse(BASE_URL + GET_ALL));
      var data = customerDataModelFromJson(response.body);
      logger(message: data.data.toString());
      return data;
    } catch (e, s) {
      logger(message: e.toString(), stacktrace: s);
      return null;
    }
  }

  Future<String?> deleteCustomers({id}) async {
    try {
      var response = await http.delete(
          Uri.parse(BASE_URL + GET_ALL + (id != null ? '$id' : '')));
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
      var response = await http.post(Uri.parse(BASE_URL + CREATE_CUSTOMERS),
          body: newCostumers.toJson());
      var data = newCreatedCustomersModelFromJson(response.body);
      logger(message: data.toString());
      return data;
    } catch (e, s) {
      logger(message: e.toString(), stacktrace: s);
      return null;
    }
  }

  Future<CustomerDataModel?> updateCustomers() async {
    try {
      var response = await http.put(Uri.parse(BASE_URL + GET_ALL));
      var data = customerDataModelFromJson(response.body);
      logger(message: data.data.toString());
      return data;
    } catch (e, s) {
      logger(message: e.toString(), stacktrace: s);
      return null;
    }
  }

  logger({message, stacktrace}) {
    log(message, stackTrace: stacktrace, name: 'Provider log');
  }
}
