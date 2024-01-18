import 'package:noobz/api/api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/utils/string.dart';

class ClientApi {
  addClient(
    name,
    email,
    password,
    confirmPassword,
    payment,
    price,
    date,
    unitName,
    unitNumber,
    unitType,
  ) async {
    print('ffffffffffffffffffffffffffffffffffffffffff');

    var url = BASE_URL + 'client/create';

    var data;
    data = {
      'name': name.toString(),
      'email': email.toString(),
      'password': password.toString(),
      'event_name': payment.toString(),
      'payment_amount': price.toString(),
      // 'date': date.toString(),
      'unit_name': unitName.toString(),
      'unit_number': unitNumber.toString(),
      'unit_type': unitType.toString(),
      'account_type' : 'COMPANY',
      
    }; 
    print(data);

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print('ddddddddddddddddddddddddddddddddddddddddddddddd');
    print(response.toString());
    if (!response['error']) {
      //  User user = User(response['user']);

      return true;
    } else {
      return false;
    }
  }
}
