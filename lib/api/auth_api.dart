import 'package:noobz/api/api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/utils/string.dart';
class UserApi {
register(name, email, password, ) async {
  var url = BASE_URL + 'register';
  var data;
  data = {
    'name': name.text.toString(),
    'email': email.text.toString(),
    'password': password.text.toString(),
    
  };

  var response = await Api.execute(
    url: url,
    data: data,
  );
  print(response);
  if (!response['error']) {
    User user = User(response['user']);

    return true;
  } else {
    return false;
  }
}
}