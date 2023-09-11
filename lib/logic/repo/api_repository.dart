import 'package:connecting_to_react_app/logic/model/customer_model.dart';

import '../model/create_costumers.dart';
import '../model/new_user.dart';
import '../model/update_customer_model.dart';
import '../provider/api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();
  ApiRepository();

  Future<CustomerDataModel?> fetchCustomerApi() async {
    return await _apiProvider.fetchCustomers();
  }

  Future<NewCreatedCustomersModel?> createCustomersApi(
      {required CreateCustomersModel newCostumers}) async {
    return await _apiProvider.createCustomers(newCostumers: newCostumers);
  }

  Future<String?> deleteCustomersApi({required String id}) async {
    return await _apiProvider.deleteCustomers(id: id);
  }

  Future<void> updateCustomersApi(
      {required UpdateCustomersModel update}) async {
    _apiProvider.updateCustomers(update: update);
  }
}
