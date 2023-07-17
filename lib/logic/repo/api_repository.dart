import 'package:connecting_to_react_app/logic/model/customer_model.dart';

import '../model/create_costumers.dart';
import '../model/new_user.dart';
import '../provider/api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();
  ApiRepository();

  Future<CustomerDataModel?> fetchCustomerApi() {
    return _apiProvider.fetchCustomers();
  }
   Future<NewCreatedCustomersModel?> createCustomersApi({required CreateCustomersModel newCostumers}) {
    return _apiProvider.createCustomers(newCostumers: newCostumers);
  }

   Future<String?> deleteCustomersApi({required String id}) {
    return _apiProvider.deleteCustomers(id: id);
  }
}
